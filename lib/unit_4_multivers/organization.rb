module Unit4Multivers
  class Client

    def organization_info_list
      get "/#{database}/OrganizationInfoList"
    end

    def organization_info organization_id
      get "/#{database}/OrganizationInfo/#{organization_id}"
    end

    def organization organization_id
      get "/#{database}/Organization/#{organization_id}"
    end

    def create_organization data
      post "/#{database}/Organization", data
    end

    def update_organization organization_id, data
      put "/#{database}/Organization/#{organization_id}", data
    end

    def delete_organization organization_id
      delete "/#{database}/Organization/#{organization_id}"
    end
  end
end
