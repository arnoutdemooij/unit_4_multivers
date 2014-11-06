module Unit4Multivers
  class Client
    def project_nvl(opts = {})
      required = [:database]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" }

      get "#{opts.fetch(:database)}/ProjectNVL", opts
    end

    def project_info(opts = {})
      required = [:database, :project_id]
      opts.fetch(required) { raise ArgumentError, "Missing required options: #{required - opts.keys}" }

      get "#{opts.fetch(:database)}/ProdjectInfo/#{opts.fetch(:project_id)}", opts
    end
  end
end