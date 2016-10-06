module Unit4Multivers
  class Client

    def customer_info(opts = {})
      required = [:database, :customer_id]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/CustomerInfo/#{opts.fetch(:customer_id)}"
    end

    def customer_info_list(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/CustomerInfoList", opts
    end

    def customer_invoice_info_list(opts = {})
      required = [:database, :id]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/CustomerInvoiceInfoList/#{id}", opts
    end

  end
end
