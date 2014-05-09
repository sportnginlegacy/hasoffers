module HasOffersModel

  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods

    # requires that your model has the column has_offer_id
    # requires that you implement the method has_offers_params within your model
    def has_offers_model(has_offers_class_name)

      has_offers_class = "HasOffers::#{has_offers_class_name}".constantize

      class_eval do

        define_method("has_offers_create") do
          if respond_to? :has_offer_id
            response = has_offers_class.create(has_offers_params)
            if response.success?
              if response.data.is_a? Hash
                # return_object is true
                self.has_offer_id = response.data[has_offers_class_name]["id"].to_i
              else
                # return_object is false
                self.has_offer_id = response.data.to_i
              end
            end
            check_for_errors(response)
          end
        end

        define_method("has_offers_update") do
          if respond_to?(:has_offer_id) and has_offer_id
            response = has_offers_class.update(has_offer_id, has_offers_params)
            check_for_errors(response)
          end
        end

        define_method("check_for_errors") do |response|
          unless response.success?
            response.error_messages.each do |error_message|
              new_error_message = "HasOffers API Error: #{error_message}"
              if self.errors.respond_to?(:add_to_base)
                self.errors.add_to_base new_error_message
              else
                self.errors.add :base, new_error_message
              end
            end
          end
          response.success?
        end

      end

    end

  end

end
