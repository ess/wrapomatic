require 'wrapomatic/line/processor'

module Wrapomatic

  # Wrap a single line
  #
  # @!attribute [r] columns
  #   @return [Integer] the columns cutoff
  #
  # @!attribute [r] indents
  #   @return [Integer] the indentation level
  #
  # @!attribute [r] original
  #   @return [String] the original text
  class Line
    # An indentation in Wrapomatic is two spaces
    INDENTATION = '  '

    attr_reader :original, :indents, :columns

    # @param original [String] a single line of text
    #
    # @param indents [Integer] the number of indentation levels to which the
    #   line should be wrapped
    #
    # @param columns [Integer] the number of columns to which the line should be
    #   wrapped
    #
    # @raise [ArgumentError] if the provided text contains newline characters
    def initialize(original, indents, columns)
      @original, @indents, @columns = original, indents, columns
      raise ArgumentError.new('original may not contain newline') if contains_newline?
    end

    # The result of wrapping the text to the provided indentation level and
    # columns
    #
    # @return [Array<String>] the original line broken into several lines that
    #   adhere to the column cutoff and indentation level
    def wrapped
      @wrapped ||= indented.length <= columns ? 
        [indented] :
        Processor.process(self)
    end

    # The indented line before wrapping
    #
    # @return [String] the line indented to the indentation level
    def indented
      "#{INDENTATION * indents}#{original}"
    end

    private
    def contains_newline?
      original.chars.include?("\n")
    end
  end
end
