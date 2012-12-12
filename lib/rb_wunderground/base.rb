require 'json'
require 'httparty'
require 'hashie'

module RbWunderground
  class Base
    FEATURES = %w[conditions forecast forecast10day almanac hourly hourly10day alerts astronomy
                  tide yesterday currenthurricaine geolookup rawtide webcams]

    attr_reader :api_key
    attr_reader :format

    def initialize(key)
      @api_key = key
      @format = ".json"
    end

    def base_url
      "http://api.wunderground.com/api/#{api_key}/"
    end

    FEATURES.each do |name|
      define_method(name) do |arg|
        url = ""
        url << base_url << name << "/q/" << arg << format
        fetch_result(url)
      end
    end

    def method_missing(name, *args, &block)
      if name =~ /^history_(.+)$/ || name =~ /^planner_(.+)$/
        url = ""
        url << base_url << name.to_s << "/q/" << args[0] << format
        fetch_result(url)
      else
        super
      end
    end

    def fetch_result(url)
      response = HTTParty.get(url)
      Hashie::Mash.new(JSON.parse(response.body))
    end
    private :fetch_result

  end

end