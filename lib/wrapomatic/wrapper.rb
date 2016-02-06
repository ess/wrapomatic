require 'wrapomatic/line'

module Wrapomatic
  class Wrapper
    attr_reader :text, :lines, :indents, :columns

    def initialize(text, indents = 0, columns = 80)
      @text, @indents, @columns = text, indents, columns
      @lines = []
      spit_some_mad_fire
    end

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
      @unwrapped ||= text.split("\n")
    end
  end
end
