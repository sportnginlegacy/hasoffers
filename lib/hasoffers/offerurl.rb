module HasOffers
  
  class OfferUrl < Base

    Target = 'OfferUrl'

    class << self

      def create(data, return_object = false)
        requires!(data, %w[offer_id name preview_url offer_url])
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
