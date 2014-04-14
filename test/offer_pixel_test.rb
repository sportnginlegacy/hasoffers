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
    assert ! response.body['response']['data'].empty?
  end

  def test_create_and_return_object
    response = HasOffers::OfferPixel.create(good_params, true)
    assert ! response.body['response']['data']['OfferPixel']['id'].empty?
  end

  def test_update
    response = HasOffers::OfferPixel.update(1, 'type' => 'url')
    assert_success response
  end

  def test_find_all
    response = HasOffers::OfferPixel.find_all({})
    assert_success response
    assert_equal(response.body['response']['status'], 1)
    assert_equal(response.body['response']['data']['1']['OfferPixel'], {"id"=>"1", "affiliate_id"=>2, "offer_id"=>1, "code"=>"<div id=\"pixel_code_1\" style=\"white-space:pre;><p><img src=\"http://my-example-pixel.com\" /></p></div>", "status"=>"active", "type"=>"image"})
    assert response.data.compact.length > 0, "No invoices were returned."
  end




end
