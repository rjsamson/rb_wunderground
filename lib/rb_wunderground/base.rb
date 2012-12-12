require 'json'
require 'httparty'
require 'hashie'

module RbWunderground
  class Base
    FEATURES = %w[alerts almanac astronomy conditions currenthurricaine forecast forecast10day
                  geolookup hourly hourly10day rawtide tide webcams yesterday]

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
        url = build_url([name], arg)
        fetch_result(url)
      end
    end

    def method_missing(meth, *args, &block)
      name = meth.to_s
      if name =~ /^history_(.+)$/ || name =~ /^planner_(.+)$/
        url = build_url([name], args[0])
        fetch_result(url)
      elsif name.scan("_and_").any?
        list = name.split("_and_").reject { |n| n=~ /^history_(.+)$/ || n =~ /^planner_(.+)$/ }
        if list & FEATURES == list
          features = name.split("_and_")
          url = build_url(features, args[0])
          fetch_result(url)
        else
          super
        end
      else
        super
      end
    end

    def fetch_result(url)
      response = HTTParty.get(url)
      Hashie::Mash.new(JSON.parse(response.body))
    end
    private :fetch_result

    def build_url(features, arg)
      url = ""
      url << base_url
      features.each { |f| url << f << '/' }
      url << 'q/' << arg << format
      url
    end
    private :build_url

  end

end