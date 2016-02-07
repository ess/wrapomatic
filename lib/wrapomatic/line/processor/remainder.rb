require 'wrapomatic/line/processor/base'
require 'wrapomatic/line/processor/primary'

module Wrapomatic
  class Line
    module Processor
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
