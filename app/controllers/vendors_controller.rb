class VendorsController < ApplicationController
  def index
    @vendors = @raw_vendors.v
  end

  def show
    @vendors = @raw_vendors.v
    @vendor =  @vendors.select { |vendor| vendor.vid == params[:id] + "." + params[:format] }.first
    getvendorcatalogs_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: {VendorID: params[:id] + '.' +  params[:format]}}).GetVendorCatalogs
    @catalogs = JSON.parse(getvendorcatalogs_response.body, object_class: OpenStruct)
  end


end
