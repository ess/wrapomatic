require 'wrapomatic/line'

module Wrapomatic

  # Wrap several lines
  #
  # @!attribute [r] text
  #   @return [String] the text to wrap
  #
  # @!attribute [r] lines
  #   @return [Array<String>] the text after wrapping as individual lines
  #
  # @!attribute [r] indents
  #   @return [Integer] the indentation level
  #
  # @!attribute [r] columns
  #   @return [Integer] the column cutoff
  class Wrapper
    attr_reader :text, :lines, :indents, :columns

    # @param text [String] the text to wrap
    #
    # @param indents [Integer] the level to which each line should be
    #   indented
    #
    # @param columns [Integer] the column to which each line should be
    #   wrapped
    def initialize(text, indents = 0, columns = 80)
      @text, @indents, @columns = text, indents, columns
      @lines = []
      spit_some_mad_fire
    end

    # The text wrapped to the desired indentation level and column cutoff
    #
    # @return [String] the wrapped text, joined by newlines
    def wrapped
      @lines.join("\n")
    end

    private
    def spit_some_mad_fire
      @lines = unwrapped_lines.map {|line|
        Line.new(line, indents, columns).wrapped
      }.flatten
    end

    def unwrapped_lines
      text.split("\n")
    end
  end
end
