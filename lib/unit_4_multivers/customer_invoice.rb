module Unit4Multivers
  class Client

    def customer_invoice_info_list customer_id, invoice_state=nil
      querystring = { 'invoiceState' => invoice_state }.compact.map { |param, value| "#{param}=#{value}" }.join('&')
      get "/#{database}/CustomerInvoiceInfoList/#{customer_id}" + (querystring.present? ? "?#{querystring}" : '')
    end

    def customer_invoice_info customer_invoice_id
      get "/#{database}/CustomerInvoiceInfo/#{customer_invoice_id}"
    end

    def customer_invoice customer_invoice_id
      get "/#{database}/CustomerInvoice/#{customer_invoice_id}"
    end

    def create_customer_invoice data
      post "/#{database}/CustomerInvoice", data
    end

    def update_customer_invoice customer_invoice_id, data
      put "/#{database}/CustomerInvoice/#{customer_invoice_id}", data
    end
  end
end
