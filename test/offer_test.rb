require File.dirname(__FILE__) + '/test_helper'

class OfferTest < Test::Unit::TestCase

  def good_params
    {
      'name' => 'Test',
      'description' => 'Test',
      'advertiser_id' => '1',
      'offer_url' => 'test',
      'preview_url' => 'test',
      'protocol' => 'https',
      'status' => 'active',
      'expiration_date' => (Date.today + 30).to_s,
      'payout_type' => 'cpa_flat',
      'revenue_type' => 'cpa_both',
      'default_payout' => '4.50',
      'max_payout' => '2.50',
      'max_percent_payout' => '15.00'
    }
  end

  def test_create
    response = HasOffers::Offer.create(good_params)
    assert_success response
  end

  def test_update
    response = HasOffers::Offer.update(1, 'name' => "Test")
    assert_success response
  end

end