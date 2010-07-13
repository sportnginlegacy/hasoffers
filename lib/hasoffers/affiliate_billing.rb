module HasOffers

  class AffiliateBilling < Base

    Target = 'AffiliateBilling'

    class << self

      def find_invoice_stats(params)
        requires!(params, %w[affiliate_id end_date])
        get_request(Target, 'findInvoiceStats', params)
      end

      def find_all_invoices(params)
        response = get_request(Target, 'findAllInvoices', params)
        if response.success?
          # strip out the clutter
          data = response.data.map do |invoice|
            invoice[1].values.first
          end
          response.set_data data
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