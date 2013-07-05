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

    end
    
  end
  
end