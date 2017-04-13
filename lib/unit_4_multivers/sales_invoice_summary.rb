module Unit4Multivers
  class Client

    def sales_invoice_summary customer_id, start_date=nil
      get "/#{database}/SalesInvoiceSummary/#{customer_id}" + (start_date.present? ? "?startDate=#{start_date}" : "")
    end
  end
end
