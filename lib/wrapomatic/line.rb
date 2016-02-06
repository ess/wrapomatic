module Wrapomatic
  class Line
    attr_reader :original, :indents, :columns

    def initialize(original, indents, columns)
      @indents, @columns = indents, columns
      @original = "#{indentation * indents}#{original}"
      raise ArgumentError.new('original may not contain newline') if contains_newline?
    end

    def wrapped
      @wrapped ||= process_line
    end

    private
    def indentation
      @indentation ||= '  ' * indents
    end

    def contains_newline?
      original.chars.include?("\n")
    end

    def process_line
      return [original] if original.length <= columns

      [primary_line] +
        self.class.new(original.lstrip, indents, columns).wrapped
    end

    def primary_line
      original.slice!(0..line_break).rstrip
    end

    def line_break
      if breaking_whitespace > indentation.length && breaking_whitespace < columns
        return breaking_whitespace
      end

      columns
    end

    def breaking_whitespace
      original.rindex(/(\s|-)/, columns).to_i
    end
  end
end
