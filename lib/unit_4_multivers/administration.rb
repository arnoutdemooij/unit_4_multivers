module Unit4Multivers
  class Client
    def administrations(opts = {})
      get "/AdministrationNVL", opts
    end

    def administration_group_nvl(opts ={})
      get "/AdministrationGroupNVL", opts
    end

    def administration_info_list(opts = {})
      get "/AdministrationInfoList", opts
    end
    # opts = { params: { userName: "username"} }
  end
end
