module Wrapomatic
  class Line
    module Processor
      class Base
        attr_reader :text, :columns

        def initialize(text, columns)
          @text, @columns = text, columns
        end

        def content
          processed
        end

        private
        def processed
          text
        end
      end
    end
  end
end
