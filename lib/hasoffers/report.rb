module HasOffers

  class Report < Base

    Target = 'Report'

    class << self

      def get_stats(params)
        requires!(params, %w[fields])
        response = get_request(Target, 'getStats', params)
        if response.success?
          # strip out the 'Stat' keys which is just extra clutter
          data = response.data.map do |stat|
            stat["Stat"]
          end
          response.set_data data
        end
        response
      end

      def get_conversions(params)
        response = get_request(Target, 'getConversions', params)
        if response.success?
          # strip out the 'Stat' keys which is just extra clutter
          data = response.data.map do |stat|
            stat["Stat"]
          end
          response.set_data data
        end
        response        
      end

    end

  end
  
end