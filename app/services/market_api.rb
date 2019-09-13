class MarketAPI
  def initialize(params)
    @baseurl = params[:baseurl]
    @xidentity = params[:xidentity]
    @data = params[:data]
    @conn = Faraday.new
  end

  # Catalog Controller - Requests
  def GetVendors
    @conn.post do |req|
      req.url @baseurl + '/catalog/GetVendors'
      req.headers['x-identity'] = @xidentity
    end
  end

  def GetCatalogItems
    @conn.post do |req|
      req.url @baseurl + '/catalog/GetCatalogItems'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def GetOrderList
    @conn.post do |req|
      req.url @baseurl + '/orderhistory/GetList'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  #Order History Controller - Requests
  def GetOrderDetails
    @conn.post do |req|
      req.url @baseurl + '/orderhistory/GetOrderDetails'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  #Shopping Cart Controller - Requests
  def Restore
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/Restore'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def GetVendorsDetails
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/GetVendorsDetails'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def GetCatalogItemInfo
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/GetCatalogItemInfo'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def AddItem
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/AddItem'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def ReorderItem
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/ReorderItem'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/json'
      req.body = @data.to_json
    end
  end

  def UpdateItem
    # POST /api/market/shoppingcart/UpdateItem HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2^^anand.padia@gmail.com
    # SaleItemId=619910849401.94393&Qty=1&Notes=
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/UpdateItem'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def GetVendorCatalogs
    @conn.post do |req|
      req.url @baseurl + '/vendorcatalog/GetVendorCatalogs'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def RemoveItem
    # POST /api/market/shoppingcart/RemoveItem HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2^^anand.padia@gmail.com
    # SaleItemId=620497748757.05193
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/RemoveItem'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def SetShip2Addr
    # POST /api/market/shoppingcart/SetShip2Addr HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2^^anand.padia@gmail.com
    # Content-Type: application/json
    # {
    #   "i": "618354795703.84625", --> ShoppingCartID
    #   "a": {
    #     "r": false,
    #     "c": "Andy",
    #     "fn": "Andy",
    #     "ln": "Andy",
    #     "e": "Andy",
    #     "t": "Andy",
    #     "f": "Andy",
    #     "a": "Andy",
    #     "ct": "Andy",
    #     "ctr": "Andy",
    #     "s": "Andy",
    #     "z": "Andy"
    #   }
    # }
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/SetShip2Addr'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/json'
      req.body = @data.to_json
    end
  end

  def CreateSale
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/CreateSale'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def SetVendorInfo
    @conn.post do |req|
      req.url @baseurl + '/shoppingcart/SetVendorInfo'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/json'
      req.body = @data.to_json
    end
  end

  def CreateSake
  end

  def GetDeliveryMethods
  end

  # User Controller - Requests
  def Authenticate
    # POST /api/market/user/Authenticate HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2
    # Email=anand.padia%40gmail.com&Pswd=password%40123
    @conn.post do |req|
      req.url @baseurl + '/user/Authenticate'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def Register
    # POST /api/market/user/Register HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2
    # Company=ghughu&Fname=jhon&Lname=doe&Email=jhon%40ghughu.com&Tel=1921232134&TaxId=FU420&Addr=Mud+nahi+hai+drive&City=Tuson&State=Arizona&Zip=85743&Password=1whoknew%40what
    @conn.post do |req|
      req.url @baseurl + '/user/Register'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def PasswordRecover
    # POST /api/market/user/PasswordRecover HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2
    # Email=anand.padia%40gmail.com
    @conn.post do |req|
      req.url @baseurl + '/user/PasswordRecover'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

  def PasswordSet
    # POST /api/market/user/PasswordSet HTTP/1.1
    # x-identity: BFF28D257DD149BA9B45B01AC8E89FB2^^anand.padia@gmail.com
    # Password=password%40123
    @conn.post do |req|
      req.url @baseurl + '/user/PasswordSet'
      req.headers['x-identity'] = @xidentity
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(@data)
    end
  end

end
