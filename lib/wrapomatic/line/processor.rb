require 'wrapomatic/line/processor/primary'
require 'wrapomatic/line/processor/remainder'

module Wrapomatic
  class Line

    # A deep and dark module that really shouldn't be used directly
    #
    # @api private
    module Processor

      # Process a line
      #
      # @param [Line] a Line object to process
      #
      # @return [Array<String>] the processed line, broken into individually
      #   wrapped lines
      def self.process(line)
        columns = line.columns
        indents = line.indents
        text = line.indented

        [Primary.new(text, columns).content] +
          line.class.new(
            Remainder.new(text, columns).content,
            indents,
            columns
          ).wrapped
      end
    end
  end
end
