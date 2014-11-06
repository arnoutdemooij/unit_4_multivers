module Unit4Multivers
  class Client

    def customer_info(opts = {})
      required = [:database, :customer_id]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "/#{opts.fetch(:database)}/CustomerInfo/#{customer_id}"
    end

    def customer_info_list(opts = {})
      required = [:database]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "#{opts.fetch(:database)}/CustomerInfoList", opts
    end

    def customer_invoice_info_list(opts = {})
      required = [:database, :id]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "#{opts.fetch(:database)}/CustomerInvoiceInfoList/#{id}", opts
    end


  end
end
