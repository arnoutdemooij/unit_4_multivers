module Unit4Multivers
  class Client
    def product(opts = {})
      required = [:database, :product_id]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/Product/#{opts.fetch(:product_id)}", opts
    end

    def product_info(opts = {})
      required = [:database, :product_id]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/ProductInfo/#{opts.fetch(:product_id)}", opts
    end

    def product_info_list(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/ProductInfoList", opts
    end

    def product_nvl(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/ProductNVL", opts
    end
  end
end