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
      :PartId => params[:pid],
      :VendorId => params[:vid],
      :PartNum => params[:pn]
    }
    getcatalogiteminfo_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).GetCatalogItemInfo
    @thisproduct = JSON.parse(getcatalogiteminfo_response.body, object_class: OpenStruct)
    @thisactn = params[:actn]
    @thissid = params[:sid]
    @thisqty = params[:sqty]
    render partial: "catalog_item_info"
  end

  def prod_crud
    if params[:actn] == "additem"
      add_items
    elsif params[:actn] == "updateitem"
      update_item
    end
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

  def update_item
    @item = ""
    data = {
      :SaleItemId => params[:sid],
      :Qty => params[:qty],
      :Notes => params[:notes]
    }
    updateitem_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).UpdateItem
    @updateitem = JSON.parse(updateitem_response.body, object_class: OpenStruct)
    redirect_to params[:ref_uri]
  end

  def delete_item
    @item = ""
    data = {
      :SaleItemId => params[:sid],
    }
    deleteitem_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).RemoveItem
    @deleteitem = JSON.parse(deleteitem_response.body, object_class: OpenStruct)
    redirect_back fallback_location: root_path
  end

  def new
  end

  def reorder
    jsondata = []
    params["si"].each do |d,index|
      if index[:Checked] == "1"
        jsondata << {"sid": d, "q": index[:Qty]}
      end
    end
    data = {"l": jsondata}
    reorder_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).ReorderItem
    @thisproduct = JSON.parse(reorder_response.body, object_class: OpenStruct)
    redirect_to order_details_path(sid: params[:sid]), notice: "Items added to your cart."
  end

end
