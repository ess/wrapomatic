require 'wrapomatic/version'
require 'wrapomatic/line'
require 'wrapomatic/wrapper'

module Wrapomatic
  def self.wrap(text, options = {})
    options[:indents] ||= 0
    options[:columns] ||= 80
    Wrapper.new(text, options[:indents], options[:columns]).wrapped
  end
end
