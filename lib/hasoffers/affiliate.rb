module HasOffers
  
  class Affiliate < Base

    Target = 'Affiliate'

    def create(params)
      requires!(params, 'company')
      requires!(params, 'address1')
      requires!(params, 'city')
      requires!(params, 'country')
      requires!(params, 'zipcode')
      requires!(params, 'phone')
      if params['country'] == 'US' or params['country'] == 'CA'
        requires!(params, 'region')
      end
      response = post(Target, 'create', params)
    end

    def update(params)
      response = post(Target, 'update', params)
    end

  end
  
end