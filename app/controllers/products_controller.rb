class ProductsController < ApplicationController
  def index
    @vendors = @raw_vendors.v
    @products = @raw_products.i
    @search_tags = @vendors.pluck(:n).uniq + @products.pluck(:pn).uniq
  end

  def search
  	@vendors = @raw_vendors.v
    @products = @raw_products.i
  end
end