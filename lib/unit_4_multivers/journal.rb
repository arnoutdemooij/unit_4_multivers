module Unit4Multivers
  class Client
    # GET api/{database}/JournalInfo/{journalId}?fiscalYear={fiscalYear}
    # Gets the specified JournalInfo.
    # GET api/{database}/JournalInfo/{journalId}
    # Gets the specified JournalInfo.

    def journal_info(opts = {})
      required = [:database, :journal_id]
      check_required_parameters(required, opts)
      get "/#{opts.fetch(:database)}/JournalInfo/#{opts.fetch(:journal_id)}", opts
    end


    # GET api/{database}/JournalInfoList?fiscalYear={fiscalYear}
    # Gets a list of JournalInfo that matches the specified criteria
    # GET api/{database}/JournalInfoList
    # Gets a list of JournalInfo that matches the specified criteria

    def journal_info_list(opts = {})
      required = [:database]
      check_required_parameters(required, opts)

      get "/#{opts.fetch(:database)}/JournalInfoList", opts
    end
  end
end