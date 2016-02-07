module Wrapomatic
  class Line
    module Processor

      # The base processor from which all other processors inherit
      #
      # @note To create a new Line processor, inherit from this class and
      #   implement the private method `processed`, returning a String
      #
      # @example Creating A New Line Processor
      #   class MyProcessor < Wrapomatic::Line::Processor::Base
      #     private
      #     def processed
      #       "the conent that we want to pass back after processing"
      #     end
      #   end
      #
      # @!attribute [r] text
      #   @return [String] the text being processed
      #
      # @!attribute [r] columns
      #   @return [Integer] the maximum number of characters in the result
      class Base
        attr_reader :text, :columns

        # @param text [String] the text to process
        #
        # @param columns [Integer] the column cutoff at which the line should
        #   be wrapped
        def initialize(text, columns)
          @text, @columns = text, columns
        end

        # The content after processing
        #
        # @return [String] the line part resulting from processing
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
