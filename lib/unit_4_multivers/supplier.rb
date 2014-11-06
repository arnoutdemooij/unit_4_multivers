module Unit4Multivers
  class Client
    def supplier_info(opts = {})
      required = [:database, :supplier_id]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }
      get "#{opts.fetch(:database)}/SupplierInfo/#{opts.fetch(:supplier_id)}", opts
    end

    def supplier_info_list(opts = {})
      required = [:database]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }
      get "#{opts.fetch(:database)}/SupplierInfoList", opts
    end



    # API Description
    # GET api/{database}/SupplierInvoiceInfoList/OpenInvoices/{id}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria

    # GET api/{database}/SupplierInvoiceInfoList/{Id}/{startDate}/{endDate}?invoiceState={invoiceState}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{id}/{startDate}/{endDate}?fiscalYear={fiscalYear}&invoiceState={invoiceState}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{id}/{startDate}/{endDate}?fiscalYear={fiscalYear}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{id}/{invoiceState}?startDate={startDate}&endDate={endDate}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{fiscalYear}/{invoiceState}?id={id}&startDate={startDate}&endDate={endDate}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{fiscalYear}/{invoiceState}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{id}/{fiscalYear}?startDate={startDate}&endDate={endDate}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{id}?startDate={startDate}&endDate={endDate}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{Id}?invoiceState={invoiceState}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{Id}?fiscalYear={fiscalYear}&invoiceState={invoiceState}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{id}?fiscalYear={fiscalYear}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria
    # GET api/{database}/SupplierInvoiceInfoList/{Id}
    # Gets a list of SupplierInvoiceInfo that matches the specified criteria

    def supplier_invoice_info_list(opts = {})
      get "/SupplierInvoiceInfoList", opts
    end
  end
end