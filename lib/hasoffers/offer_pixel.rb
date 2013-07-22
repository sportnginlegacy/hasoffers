module HasOffers
  
  class OfferPixel < Base

    Target = 'OfferPixel'

    class << self

      def create(data, return_object = false)
        requires!(data, %w[offer_id affiliate_id type code status])
        params = build_data data, return_object
        post_request(Target, 'create', params)
      end

      def update(id, data, return_object = false)
        params = build_data data, return_object
        params['id'] = id
        post_request(Target, 'update', params)
      end

      def simplify_response_data data
        # Data is returned as a hash like this:
        # {
        #   "1" => {"OfferPixel" => {<what we really want>}, ... },
        #   "2" => {"OfferPixel" => {<what we really want>}, ... }
        # }
        #
        # This function will extract it out.
        data.map { |id, offer_pixel_data| offer_pixel_data["OfferPixel"] }
      end

      def find_all(params)
        response = post_request(Target, 'findAll', params)
        if response.success?
          # strip out the clutter
          response.set_data simplify_response_data(response.data)
        end
        response
      end
    end
  end
  
end