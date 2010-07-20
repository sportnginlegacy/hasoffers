require File.dirname(__FILE__) + '/test_helper'

class ReportTest < Test::Unit::TestCase

  def test_get_stats
    response = HasOffers::Report.get_stats(
      'fields' => ['Stat.clicks'],
      'filters' => ['Stat.affiliate_id' => ['values' => 1, 'conditional' => 'EQUAL_TO']]
    )
    assert_success response
  end

  def test_get_conversions
    response = HasOffers::Report.get_conversions(
      'fields' => ['Stat.payout'],
      'filters' => ['Stat.affiliate_id' => ['values' => 1, 'conditional' => 'EQUAL_TO']]
    )
    assert_success response
  end

end