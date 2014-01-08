module HasOffers

  class Goal < Base

    Target = 'Goal'

    class << self

      def create(data, return_object = false)
        requires!(data, %w[offer_id name protocol])
        params = build_data data, return_object
        post_request(Target, 'create', params)
      end

      def update(id, data, return_object = false)
        params = build_data data, return_object
        params['id'] = id
        post_request(Target, 'update', params)
      end

      def generate_tracking(id, params = {}, options = {})
        post_request(Target, 'generateTracking', { 'goal_id' => id, 'params' => params, 'options' => options })
      end
    end

  end

end
