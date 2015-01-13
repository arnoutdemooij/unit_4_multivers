module Unit4Multivers
  class Client
    def opening_balance_info(opts = {})
      required = [:database, :account_id, :fiscal_year]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/OpeningBalanceInfo/#{opts.fetch(:account_id)}/#{opts.fetch(:fiscal_year)}", opts
    end
  end
end
