require File.dirname(__FILE__) + '/test_helper'

class AdvertiserTest < Test::Unit::TestCase
  def test_set_base_uri
    new_uri = "http://example.com"
    HasOffers::Base.base_uri = new_uri
    assert_equal new_uri, HasOffers::Base.base_uri
  end
end

