require File.dirname(__FILE__) + '/test_helper'

class AffiliateTest < Test::Unit::TestCase

  def good_params
    {'company' => 'Hockey Organization',
     'address1' => '100 East 1st St.',
     'city' => 'Minneapolis',
     'country' => 'USA',
     'zipcode' => '55431',
     'region' => 'MN',
     'phone' => '123-123-1234'
    }
  end

  def test_create
    response = HasOffers::Affiliate.create(good_params)
    assert_success response
  end

  def test_update
    response = HasOffers::Affiliate.update(1, {'company' => 'Hockey Organization',
                                               'address1' => '100 East 1st St.',
                                               'city' => 'Minneapolis',
                                               'country' => 'USA',
                                               'zipcode' => '55431',
                                               'region' => 'MN',
                                               'phone' => '123-123-1234'})
    assert_success response
  end

end