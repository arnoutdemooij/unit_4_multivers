module Unit4Multivers
  class Client
    def project_nvl(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/ProjectNVL", opts
    end

    def project_info(opts = {})
      required = [:database, :project_id]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/ProdjectInfo/#{opts.fetch(:project_id)}", opts
    end
  end
end