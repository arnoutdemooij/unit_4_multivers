module Unit4Multivers
  class Client

    def order_info_list customer_id
      get "/#{database}/OrderInfoList/#{customer_id}"
    end

    def order_info order_id
      get "/#{database}/OrderInfo/#{order_id}"
    end

    def order order_id
      get "/#{database}/Order/#{order_id}"
    end

    def create_order data
      post "/#{database}/Order", data
    end

    def update_order order_id, data
      put "/#{database}/Order/#{order_id}", data
    end

    def delete_order order_id
      delete "/#{database}/Order/#{order_id}"
    end
  end
end
