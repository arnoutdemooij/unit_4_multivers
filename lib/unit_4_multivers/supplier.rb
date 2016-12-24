module Unit4Multivers
  class Client

    def supplier_info_list
      get "/#{database}/SupplierInfoList"
    end

    def supplier_info supplier_id
      get "/#{database}/SupplierInfo/#{supplier_id}"
    end

    def supplier supplier_id
      get "/#{database}/Supplier/#{supplier_id}"
    end

    def create_supplier data
      post "/#{database}/Supplier", data
    end

    def update_supplier supplier_id, data
      put "/#{database}/Supplier/#{supplier_id}", data
    end

    def delete_supplier supplier_id
      delete "/#{database}/Supplier/#{supplier_id}"
    end
  end
end
