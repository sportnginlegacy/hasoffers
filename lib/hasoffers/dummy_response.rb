module HasOffers

  class DummyResponse

    class << self
    
      def response_for(target, method, params)
        body = self.send("response_for_#{target.downcase}_#{method.downcase}", params)
        DummyResponse.new(200, 'Ok', body, {})
      end

      # Assume return_object is set for simplicity which means just the id of offer is returned
      def response_for_offer_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_offer_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_affiliate_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_affiliate_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_affiliatebilling_createinvoice(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_affiliatebilling_updateinvoice(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_advertiser_findall(params)
        {"response" => { "status" => 1, "data" => {"1" => {"Advertiser" => {"id" => "1", "company" => "Dominoes"}}}, "errors" => {} } }
      end

      def response_for_advertiser_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_advertiser_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_conversion_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_conversion_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_affiliatebilling_findinvoicestats(params)
        {"response" => { "status" => 1, "data" => {"start_date" => params["start_date"], "end_date" => params["end_date"], "data" => [{"Stat" => {"type" => "stats", "offer_id" => "1", "payout_type" => "cpa_flat", "currency" => "USD", "amount" => "26.00000", "impressions" => "0", "clicks" => "0", "conversions" => "5", "revenue" => "2.50", "sale_amount" => "50.00"}}] }}}
      end

      def response_for_affiliatebilling_findallinvoices(params)
        {"response" => { "status" => 1, "data" => {"1" => {"AffiliateInvoice" => {"id" => "1", "affiliate_id" => "2", "datetime" => "2009-06-02 20:14:05", "start_date" => "2009-06-01", "end_date" => "2009-06-02", "is_paid" => "1", "memo" => "asdf", "status" => "active", "notes" => "", "receipt_id" => nil, "currency" => "USD", "amount" => "12.00", "conversions" => "12" }}}, "errors" => []}}
      end

      def response_for_affiliatebilling_findallinvoicesbyids(params)
        {"response" => { "status" => 1, "data" => {"1" => {"AffiliateInvoice" => {"id" => "1", "affiliate_id" => "2", "datetime" => "2009-06-02 20:14:05", "start_date" => "2009-06-01", "end_date" => "2009-06-02", "is_paid" => "1", "memo" => "asdf", "status" => "active", "notes" => "", "receipt_id" => nil, "currency" => "USD", "amount" => "12.00", "conversions" => "12" }}}, "errors" => []}}
      end

      def response_for_report_getstats(params)
        {"response"=>{"data"=>{"pageCount"=>1, "data"=>[{"Stat"=>{"affiliate_id"=>"1", "clicks"=>"20645"}}], "current"=>50, "count"=>1, "page"=>1}, "errors"=>[], "status"=>1}}
      end

      def response_for_report_getconversions(params)
        {"response"=>{"data"=>{"pageCount"=>1, "data"=>[{"Stat"=>{"affiliate_id"=>"1", "payout"=>"100.00"}}], "current"=>50, "count"=>1, "page"=>1}, "errors"=>[], "status"=>1}}
      end
      
      def response_for_rawlog_listdatedirs(params)
        {"response"=>{"data"=>{"logType"=>"clicks","dateDirs"=>[{"displayName"=>"Sep 30, 2014","dirName"=>"20140930"}]}, "errors"=>[], "status"=>1}}
      end
      
      def response_for_rawlog_listlogs(params)
        {"response"=>{"data"=>{"logType"=>"clicks","logDate"=>"20140930","logFiles"=>[{"displayName"=>"Sep 30, 2014 - 04:00 am","filename"=>"20140930/clicks-1412049600-a9wyK9.zip","startTimestamp"=>"1412049600"}]}, "errors"=>[], "status"=>1}}
      end
      
      def response_for_rawlog_getdownloadlink(params)
        {"response"=>{"data"=>{"link"=>"https://s3.amazonaws.com/ho-adserverlogs-prod/qproc/raw-logs/clicks/xxxx/20140930/clicks-1412049600-a9wyK9.zip?AWSAccessKeyId=xxxx&Expires=1412085172&Signature=xxxx"}, "errors"=>[], "status"=>1}}
      end
      
      def response_for_rawlog_getlogexpirations(params)
        {"response"=>{"data"=>{"logExpireInDays"=>{"conversions"=>"180","clicks"=>"180","impressions"=>"1"}}, "errors"=>[], "status"=>1}}
      end

    end

    attr_accessor :code, :message, :body, :headers

    def initialize(code, message, body, headers)
      @code = code
      @message = message
      @body = body
      @headers = headers
    end

    def to_hash
      @headers
    end

  end
  
end