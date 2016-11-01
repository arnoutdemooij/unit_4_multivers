module Unit4Multivers
  class Client

    def bank_account_info_list organization_id
      get "/#{database}/BankAccountInfoList/#{organization_id}"
    end

    def bank_account_info organization_id, index_number
      get "/#{database}/BankAccountInfo/#{organization_id}/#{index_number}"
    end

    def bank_account organization_id, index_number
      get "/#{database}/BankAccount/#{organization_id}/#{index_number}"
    end

    def create_bank_account data
      post "/#{database}/BankAccount", data
    end

    def update_bank_account organization_id, index_number, data
      put "/#{database}/BankAccount/#{organization_id}/#{index_number}", data
    end

    def delete_bank_account organization_id, index_number
      delete "/#{database}/BankAccount/#{organization_id}/#{index_number}"
    end
  end
end
