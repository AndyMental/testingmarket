class PagesController < ApplicationController
  def index
    @vendors = @raw_vendors.v
    @products = @raw_products.i
  end

  def about
    @vendors = @raw_vendors.v
    @products = @raw_products.i
  end

  def contact
    @vendors = @raw_vendors.v
    @products = @raw_products.i
  end

  def tandc
    @vendors = @raw_vendors.v
    @products = @raw_products.i
  end

  def policy
    @vendors = @raw_vendors.v
    @products = @raw_products.i
  end

  def orders
    @vendors = @raw_vendors.v
    getorders_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: {"PageNumber": 1, "PageSize": 20 }}).GetOrderList
    @orders = JSON.parse(getorders_response.body, object_class: OpenStruct)
    if @orders.l == []
      redirect_to login_path
    end
  end

  def order_details
    @vendors = @raw_vendors.v
    getorderdetails_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: {"SaleId": params[:sid], "VendorId": params[:vid] }}).GetOrderDetails
    @order_detail = JSON.parse(getorderdetails_response.body, object_class: OpenStruct)
  end

end