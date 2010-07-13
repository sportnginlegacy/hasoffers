module HasOffers
  
  class Offer < Base

    Target = 'Offer'

    class << self

      def create(data, return_object = false)
        requires!(data, %w[name description advertiser_id offer_url preview_url protocol status expiration_date])
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