module HasOffers
  
  class Conversion < Base

    Target = 'Conversion'

    class << self

      # number is number of conversions to create. Defaults to 1 on has offers side
      def create(data, number = nil)
        requires!(data, %w[affiliate_id offer_id payout revenue])
        params = build_data data
        params['number'] = number if number
        post_request(Target, 'create', params)
      end

      def update(id, data, return_object = false)
        params = build_data(data, return_object)
        params['id'] = id
        post_request(Target, 'update', params)
      end

    end
    
  end
  
end