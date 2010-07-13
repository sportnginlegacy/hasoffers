require File.dirname(__FILE__) + '/test_helper'

class AdvertiserTest < Test::Unit::TestCase

  def test_find_all
    response = HasOffers::Advertiser.find_all
    assert_success response
  end

  def good_params
    { 'company' => 'Dominoes',
      'address1' => '100 1st St.',
      'city' => 'Minneapolis', 
      'country' => 'USA',
      'zipcode' => '55413',
      'phone' => '123-123-1234' }
  end

  def test_create
    response = HasOffers::Advertiser.create(good_params)
    assert_success response
  end

  def test_update
    response = HasOffers::Advertiser.update(1, 'company' => "Dominoes Pizza")
    assert_success response
  end

end