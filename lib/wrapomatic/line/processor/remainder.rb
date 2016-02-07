require 'wrapomatic/line/processor/base'
require 'wrapomatic/line/processor/primary'

module Wrapomatic
  class Line
    module Processor

      # A line processor that extracts the line remainder, which is what is left
      # after the primary line is extracted.
      class Remainder < Base
        private
        def processed
          @processed ||= text.gsub(/^#{primary}/, '').lstrip
        end

        def primary
          @primary ||= Primary.new(text, columns).content
        end
      end
    end
  end
end
