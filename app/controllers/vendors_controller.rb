class VendorsController < ApplicationController
  def index
    @vendors = @raw_vendors.v
  end

  def show
    @products = @raw_products.i
    @vendors = @raw_vendors.v
    @vendor =  @vendors.select { |vendor| vendor.vid == params[:id] + "." + params[:format] }.first
  end


end
