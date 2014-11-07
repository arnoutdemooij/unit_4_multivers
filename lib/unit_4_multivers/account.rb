module Unit4Multivers
  class Client
    def account_info_list(opts = {})
      required = [:database, :fiscal_year]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/AccountInfoList/#{opts.fetch(:fiscal_year)}", opts
    end

    def account_manager(opts = {})
      required = [:database, :account_manager_id]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/AccountManager/#{opts.fetch(:account_manager_id)}", opts
    end

    def account_manager_nvl(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/AccountManagerNVL}", opts
    end

    def account_nvl(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/AccountNVL}", opts
    end

    def account_nvl_with_project_accounts(opts = {})
      required = [:database, :fiscal_year]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/AccountNVL/WithProjectAccounts/#{fiscal_year}}", opts
    end

    def account_type_nvl(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/AccountTypeNVL", opts
    end
  end
end






