require File.expand_path(File.dirname(__FILE__) + '/test_helper')
require 'has_offers_model'

class DummyModel
  include ActiveModel::Validations
  include HasOffersModel
  has_offers_model "Affiliate"
end

class HasOffersModelTest < Test::Unit::TestCase

  def create_model
    DummyModel.new
  end

  def failed_response
    OpenStruct.new :success? => false,
                   :error_messages => ["All your fault"]
  end

  def test_instantiating_a_new_has_offers_model
    assert_nothing_raised do
      create_model
    end
  end

  def test_adding_errors
    model = create_model
    model.check_for_errors failed_response
    assert model.errors[:base].include?("HasOffers API Error: All your fault"),
      "HasOffers error was not applied!"
  end

end
