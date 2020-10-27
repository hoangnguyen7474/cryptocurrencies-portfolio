module Api
  require 'httparty'
  class Base
    attr_accesor :options

    def initialize(options)
      @options = options
    end

    def request(type, url, opts = {} )
      HTTParty.send(type, url, opts).yield_self do |response|
      end
    end

    def parse_response(response)
      "#{__method__}" 
    end
  end
end