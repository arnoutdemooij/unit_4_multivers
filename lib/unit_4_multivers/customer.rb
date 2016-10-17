module Unit4Multivers
  class Client

    def customer_info_list
      get "/#{database}/CustomerInfoList"
    end

    def customer_info customer_id
      get "/#{database}/CustomerInfo/#{customer_id}"
    end

    def customer customer_id
      get "/#{database}/Customer/#{customer_id}"
    end

    def create_customer data
      post "/#{database}/Customer", data
    end

    def update_customer customer_id, data
      put "/#{database}/Customer/#{customer_id}", data
    end
  end
end
