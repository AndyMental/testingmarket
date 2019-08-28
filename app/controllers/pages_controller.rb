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
end