
module HasOffers

  class Base

    BaseUri = 'https://api.hasoffers.com/Api'
    @@api_mode = (ENV['RAILS_ENV'] == 'production' or ENV['HAS_OFFERS_LIVE'] == '1') ? :live : :test
    @@default_params = nil

    class << self

      def initialize_credentials
        config_file = ENV['HAS_OFFERS_CONFIG_FILE'] || "config/has_offers.yml"
        if File.exists?(config_file)
          config = YAML::load(IO.read(config_file))
          @@default_params = {'Format' => 'json',
                              'Service' => 'HasOffers',
                              'Version' => '2',
                              'NetworkId' => config['network_id'],
                              'NetworkToken' => config['api_key']}
        else
          @@default_params = {}
          puts "Missing config/has_offers.yml file!"
        end
      end

      def test?
        @@api_mode == :test
      end

      def live?
        @@api_mode == :live
      end

      def api_mode=(mode)
        @@api_mode = mode
      end

      def api_mode
        @@api_mode
      end

      def get_request(target, method, params)
        make_request(:get, target, method, params)
      end

      def post_request(target, method, params)
        make_request(:post, target, method, params)
      end

      def requires!(hash, required_params)
        missing_params = []
        required_params.each do |param|
          missing_params.push param unless hash.has_key?(param)
        end
        unless missing_params.empty?
          raise ArgumentError.new("Missing required parameter(s): #{missing_params.join(', ')}")
        end
      end

      private

      def new_http(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end

      def query_string(data_hash)
        # Rails to_params adds an extra open close brackets to multi-dimensional array parameters which
        # hasoffers doesn't like, so the gsub here takes care of that.
        data_hash.to_params.gsub(/\[\]\[/,'[')
      end

      def make_request(http_method, target, method, params)
        data = build_request_params(target, method, params)
        if live?
          if http_method == :post
            uri = URI.parse BaseUri
            http = new_http uri
            raw_request = Net::HTTP::Post.new(uri.request_uri)
            raw_request.body = query_string data
          else # assume get
            uri = URI.parse("#{BaseUri}?#{query_string(data)}")
            http = new_http uri
            raw_request = Net::HTTP::Get.new(uri.request_uri)
          end
          http_response = http.request raw_request
        else
          http_response = DummyResponse.response_for(target, method, params)
        end
        Response.new(http_response)
      end

      def build_request_params(target, method, params)
        initialize_credentials unless @@default_params
        params['Target'] = target
        params['Method'] = method
        params.merge @@default_params
      end

      def build_data(data, return_object = false)
        {'data' => data, 'return_object' => return_object}
      end

    end

  end

end