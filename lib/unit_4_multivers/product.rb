module Unit4Multivers
  class Client
    def product(opts = {})
      required = [:database, :product_id]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "#{opts.fetch(:database)}/Product/#{opts.fetch(:product_id)}", opts
    end

    def product_info(opts = {})
      required = [:database, :product_id]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "#{opts.fetch(:database)}/ProductInfo/#{opts.fetch(:product_id)}", opts
    end

    def product_info_list(opts = {})
      required = [:database]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "#{opts.fetch(:database)}/ProductInfoList", opts
    end

    def product_nvl(opts = {})
      required = [:database]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" if (required-opts.keys).size > 0 }

      get "#{opts.fetch(:database)}/ProductNVL", opts
    end
  end
end