require 'en'

module EN
  class Namespace
    include ::EN

    attr_reader :prefix

    def initialize(prefix)
      @prefix = prefix.to_s.upcase
    end

    def fetch(variable)
      super "#{prefix}_#{variable}"
    end
  end
end
