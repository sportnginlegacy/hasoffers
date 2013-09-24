module HasOffers

  class Affiliate < Base

    Target = 'Affiliate'

    class << self

      def find_all(params = {})
        post_request(Target, 'findAll', params)
      end

      def create(data, return_object = false)
        requires!(data, %w[company address1 city country zipcode phone])
        if data['country'] == 'US' or data['country'] == 'CA'
          requires!(data, 'region')
        end
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