require "net/http"
require "uri"

module HasOffers
  
  class Base

    API_URL = 'https://api.hasoffers.com/Api'
    @@common_params = nil

    class << self

      def initialize_credentials
        config_file = ENV['HAS_OFFERS_CONFIG_FILE'] || "config/has_offers.yml"
        if File.exists?(config_file)
          require 'YAML'
          config = YAML::load(IO.read(config_file))
          @@common_params = {
            'Format' => 'json',
            'Service' => 'HasOffers',
            'Version' => '2',
            'NetworkId' => @@config['network_id'],
            'NetworkToken' => @@config['api_key']
          }
        else
          puts "Missing config/has_offers.yml file!"
        end
      end

    end
    
    def post(target, method, params)
      data = build_data(target, method, params)
      response = Net::HTTP.post_form(URI.parse(API_URL), data)
    end

    def requires!(hash, *params)
      params.each do |param| 
        raise ArgumentError.new("Missing required parameter: #{param}") unless hash.has_key?(param) 
      end
    end

    private

    def build_data(target, method, params)
      self.class.initialize_credentials unless @@common_params      
      data = @@common_params.merge(params)
      data['Target'] = target
      data['Method'] = method
      data
    end
    
  end

end