require File.dirname(__FILE__) + '/test_helper'

class OfferTest < Test::Unit::TestCase
  
  def test_listDateDirs
    response = HasOffers::RawLog.listDateDirs('log_type' => "clicks")
    assert_success response
  end
  
  def test_listLogs
    response = HasOffers::RawLog.listLogs('log_type' => "clicks", 'date_dir' => "20140929")
    assert_success response
  end
  
  def test_getDownloadLink
    response = HasOffers::RawLog.getDownloadLink('log_type' => "clicks", 'log_filename' => "somefilename")
    assert_success response
  end
  
  def test_getLogExpirations
    response = HasOffers::RawLog.getLogExpirations()
    assert_success response
  end

end