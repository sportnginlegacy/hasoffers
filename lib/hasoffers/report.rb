module HasOffers

  class Report < Base

    Target = 'Report'

    class << self

      # Jon Phenow @ 06/13/12
      # Switched this to use POST because of some weird issues with sending
      # from behind a proxy
      def get_stats(params)
        requires!(params, %w[fields])
        response = post_request(Target, 'getStats', params)
        if response.success?
          # strip out the 'Stat' keys which is just extra clutter
          data = response.data.map do |stat|
            stat["Stat"]
          end
          response.set_data data
        end
        response
      end

      # Jon Phenow @ 06/13/12
      # Switched this to use POST because of some weird issues with sending
      # from behind a proxy
      def get_conversions(params)
        response = post_request(Target, 'getConversions', params)
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
