require File.dirname(__FILE__) + '/test_helper'

class AffiliateBillingTest < Test::Unit::TestCase

  def test_find_invoice_stats
    response = HasOffers::AffiliateBilling.find_invoice_stats('affiliate_id' => 1, 'start_date' => "06/23/10", 'end_date' => "07/23/10")
    assert_success response
  end

  def test_find_all_invoices
    response = HasOffers::AffiliateBilling.find_all_invoices({})
    assert_success response
    assert response.data.compact.length > 0, "No invoices were returned."
  end

  def test_find_all_invoices_filtered_by_affiliate
    response = HasOffers::AffiliateBilling.find_all_invoices(
      'filters' => ['AffiliateInvoice.affiliate_id' => '1'],
      'fields' => ['is_paid', 'impressions', 'clicks', 'conversions', 'amount']
    )
    assert_success response
    assert response.data.compact.length > 0, "No invoices were returned."
  end

  def test_find_all_invoices_by_ids
    response = HasOffers::AffiliateBilling.find_all_invoices_by_ids([7,11])
    assert_success response
    assert response.data.compact.length > 0, "No invoices were returned."
  end

  def good_params
    {'affiliate_id' => '1',
     'start_date' => '2010-01-01',
     'end_date' => '2010-01-31',
     'status' => 'active'
    }
  end

  def test_create
    response = HasOffers::AffiliateBilling.create_invoice(good_params)
    assert_success response
  end

  def test_update
    response = HasOffers::AffiliateBilling.update_invoice(1, {'status' => 'deleted'})
    assert_success response
  end

end