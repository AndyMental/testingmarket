class CartsController < ApplicationController
  def index
    # get cart details if loggedin
    if current_user
      @raw_cartitems = get_cart_items
    end
  end

  def cart_items
    @raw_cartitems = get_cart_items
    render partial: "cart_2"
  end

  def catalog_item_info
    data = {
      :PartId => params[:vid],
      :VendorId => "",
      :PartNum => ""
    }
    getcatalogiteminfo_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).GetCatalogItemInfo
    @thisproduct = JSON.parse(getcatalogiteminfo_response.body, object_class: OpenStruct)
    render partial: "catalog_item_info"
  end

  def add_items
    @item = ""
    data = {
      :PartId => params[:pid],
      :Qty => params[:qty],
      :Notes => params[:notes]
    }
    additem_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).AddItem
    @additem = JSON.parse(additem_response.body, object_class: OpenStruct)
    redirect_to params[:ref_uri]
  end

  def new
  end

  def update
  end

  def delete
  end
end
