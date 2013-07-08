require File.dirname(__FILE__) + '/test_helper'

class OfferPixelTest < Test::Unit::TestCase

  def good_params
    {
      'offer_id' => '1',
      'affiliate_id' => '1',
      'type' => 'image',
      'code' => "<div id=\"pixel_code_1\" style=\"white-space:pre;><p><img src=\"http:my-example-pixel.com\" /></p></div>",
      'status' => 'active'
    }
  end

  def test_create
    response = HasOffers::OfferPixel.create(good_params)
    assert_success response
  end

  def test_update
    response = HasOffers::OfferPixel.update(1, 'type' => 'url')
    assert_success response
  end

end