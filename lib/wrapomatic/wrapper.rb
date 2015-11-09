module Wrapomatic
  class Wrapper
    attr_reader :text, :lines, :indents, :columns

    def initialize(text, indents = 0, columns = 80)
      @text = text.split("\n").join(' ')
      @indents = indents
      @columns = columns
      @lines = []
      indentomize
    end

    def wrapped
      lines.join("\n")
    end

    private

    def indentomize
      until (line = next_line).nil?
        @lines.push(line)
      end
    end

    def next_line
      return nil if text.length == 0
      offset + text_up_to(space_before_location(columns - offset.length - 1))
    end

    def space_before_location(start)
      return start if start > text.length
      text.rindex(/(\s|-)/, start) || start
    end

    def text_up_to(count)
      text.slice!(0..count)
    end

    def indentation
      '  '
    end

    def offset
      indentation * indents
    end
  end
end