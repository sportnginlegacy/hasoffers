module HasOffers

  class RawLog < Base

    Target = 'RawLog'

    class << self

      def list_date_dirs(params)
         post_request(Target, 'listDateDirs', params)
      end
      
      def list_logs(params)
        post_request(Target, 'listLogs', params)
      end
      
      def get_download_link(params)
         post_request(Target, 'getDownloadLink', params)
      end
      
      def get_log_expirations(params = {})
         post_request(Target, 'getLogExpirations', params)
      end
        
    end

  end

end