module HasOffers

  class AffiliateBilling < Base

    Target = 'AffiliateBilling'

    class << self

      # Jon Phenow @ 06/13/12
      # Switched this to use POST because of some weird issues with sending
      # from behind a proxy
      def find_invoice_stats(params)
        requires!(params, %w[affiliate_id end_date])
        post_request(Target, 'findInvoiceStats', params)
      end

      def simplify_response_data data
        # Data is returned as a hash like this:
        # {
        #   "1" => {"AffiliateInvoice" => {<what we really want>}, ... },
        #   "2" => {"AffiliateInvoice" => {<what we really want>}, ... }
        # }
        #
        # This function will extract it out.
        data.map { |id, invoice_data| invoice_data["AffiliateInvoice"] }
      end

      # Jon Phenow @ 06/13/12
      # Switched this to use POST because of some weird issues with sending
      # from behind a proxy
      def find_all_invoices(params)
        response = post_request(Target, 'findAllInvoices', params)
        if response.success?
          # strip out the clutter
          response.set_data simplify_response_data(response.data)
        end
        response
      end

      # Jon Phenow @ 06/13/12
      # Switched this to use POST because of some weird issues with sending
      # from behind a proxy
      def find_all_invoices_by_ids(ids, params = {})
        params['ids'] = ids
        response = post_request(Target, 'findAllInvoicesByIds', params)
        if response.success?
          # strip out the clutter
          response.set_data simplify_response_data(response.data)
        end
        response
      end

      def create_invoice(data, return_object = false)
        requires!(data, %w[affiliate_id start_date end_date status])
        params = build_data(data, return_object)
        post_request(Target, 'createInvoice', params)
      end

      def update_invoice(id, data, return_object = false)
        params = build_data(data, return_object)
        params['id'] = id
        post_request(Target, 'updateInvoice', params)
      end

    end

  end

end
