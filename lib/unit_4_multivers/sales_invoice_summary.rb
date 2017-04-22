module Unit4Multivers
  class Client

    def sales_invoice_summary customer_id, start_date=nil, end_date=nil
      querystring = { 'startDate' => start_date, 'endDate' => end_date }.compact.map { |param, value| "#{param}=#{value}" }.join('&')
      get "/#{database}/SalesInvoiceSummary/#{customer_id}" + (querystring.present? ? "?#{querystring}" : '')
    end
  end
end
