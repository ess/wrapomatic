require 'wrapomatic/line/processor/primary'
require 'wrapomatic/line/processor/remainder'

module Wrapomatic
  class Line
    module Processor
      def self.primary(text, columns)
        Primary.new(text, columns).content
      end

      def self.remainder(text, columns)
        Remainder.new(text, columns).content
      end

      def self.process(line)
        columns = line.columns
        indents = line.indents
        text = line.indented

        [Primary.new(text, columns).content] +
          line.class.new(remainder(text, columns), indents, columns).wrapped
      end
    end
  end
end
