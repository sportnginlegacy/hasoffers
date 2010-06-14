module HasOffers
  
  class Offer < Base

    Target = 'Offer'

    def create(params)
      response = post(Target, 'create', params)
    end

    def update(params)
      response = post(Target, 'update', params)
    end
    
  end
  
end