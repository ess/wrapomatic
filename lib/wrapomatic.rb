require 'wrapomatic/version'
require 'wrapomatic/line'
require 'wrapomatic/wrapper'

# Let's line wrap some strings!
module Wrapomatic

  # Wraps the given text with optional indentation and width
  #
  # @param text [String] the text blob to wrap
  #
  # @param [Hash] options the options with which to wrap the text
  #
  # @option options [Integer] :indents (0) the number of indentation levels to
  #   use for wrapping the text
  #
  # @option options [Integer] :columns (80) the number of columes to which the
  #   text should be wrapped
  #
  # @return [String] the wrapped text
  def self.wrap(text, options = {})
    indents = options[:indents] || 0
    columns = options[:columns] || 80
    Wrapper.new(text, indents, columns).wrapped
  end
end
