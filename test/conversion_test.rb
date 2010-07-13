require File.dirname(__FILE__) + '/test_helper'

class ConversionTest < Test::Unit::TestCase

  def good_params
    {'affiliate_id' => '1', 'offer_id' => '1', 'payout' => '10.50', 'revenue' => '5.75'}
  end

  def test_create
    response = HasOffers::Conversion.create(good_params)
    assert_success response
  end

  def test_update
    response = HasOffers::Conversion.update(1, {'affiliate_id' => '1', 'offer_id' => '1', 'payout' => '11.50', 'revenue' => '6.75'})
    assert_success response
  end

end