require 'net/http'

module ApplicationHelper
  def active_class(link_path)
    active = current_page?(link_path) ? "active" : ""
  end

  def product_image_path(this_product)
    # byebug
    # url = "https://pbkproduction.azureedge.net/49dc42/globalassets/product-images/100040.jpg"
    # url = this_product.ia + this_product.i
    # url_res_status = Faraday.get(url).status
    # if url_res_status == 200
      return this_product.ia + this_product.i2
    # else
    #   return "default.jpg"
    # end
  end


  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
end
