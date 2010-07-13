module HasOffers

  class Advertiser < Base

    Target = 'Advertiser'

    class << self

      def find_all(params = {})
        get_request(Target, 'findAll', params)
      end

      def create(data, return_object = false)
        requires!(data, %w[company address1 city country zipcode phone])
        params = build_data(data, return_object)
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