require 'en/version'

require 'dotenv'

Dotenv.load

module EN
  extend self

  def fetch(variable)
    ENV[variable.to_s.upcase] || begin
      yield if block_given?
    end
  end

  TYPES = {
    int:     method(:Integer),
    integer: method(:Integer),
    float:   method(:Float)
  }

  TYPES.each do |type, conversion|
    define_method "fetch_#{type}" do |variable, error = nil, &block|
      fetch_converted variable, conversion, error, &block
    end
  end

  def fetch_converted(variable, conversion, error = nil)
    value = fetch(variable)
    value ||= yield if block_given?
    conversion[value]
  rescue
    error ? raise(error) : raise
  end
end
