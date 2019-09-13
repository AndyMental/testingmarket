class CheckoutsController < ApplicationController
  def index
    # get cart details if loggedin
    if current_user
      @raw_cartitems = get_cart_items
    end
  end

  def update_shipping_address
    if params[:residential] == "0"
      residential_bool = false
    else
      residential_bool = true
    end
    data = {
      "i": params[:cartid],
      "a": {
        "r": residential_bool,
        "c": params[:company],
        "fn": params[:fname],
        "ln": params[:lname],
        "e": "",
        "t": params[:tel],
        "f": "",
        "a": params[:address],
        "ct": params[:city],
        "ctr": params[:country],
        "s": params[:state],
        "z": params[:zip]
      }
    }
    updateshippingaddress_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).SetShip2Addr
    @thischeckout = JSON.parse(updateshippingaddress_response.body, object_class: OpenStruct)
    if params[:vid].present?
      redirect_to payment_path(vid: params[:vid])
    else
      redirect_to payment_path
    end
  end

  def payment
    if current_user
      @raw_cartitems = get_cart_items
      data = {"v": params[:vid]}
      getvendorsdetails_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).GetVendorsDetails
      @raw_vendoritems = JSON.parse(getvendorsdetails_response.body, object_class: OpenStruct)
    end
  end

  def confirm
    if current_user
      @raw_cartitems = get_cart_items
    end
  end

  def update_payment
    jsondata = []
    params["vd"].each do |d,index|
      jsondata << {"i": index[:vid], "po": index[:po], "d": index[:dm], "p": index[:pt], "n": index[:notes], "c": {"n": index[:ccrd_number],"h": index[:ccrd_cardholder],"a": index[:ccrd_billingaddr],"m": index[:ccrd_expm] == "Month" ? ("") : (index[:ccrd_expm]),"y": index[:ccrd_expy] == "Year" ? ("") : (index[:ccrd_expy])}}
    end
    data = {"l": jsondata}
    setvendorsdetails_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).SetVendorInfo
    @raw_vendoritems = JSON.parse(setvendorsdetails_response.body, object_class: OpenStruct)
    if params[:vid].present?
      redirect_to confirm_path(vid: params[:vid])
    else
      redirect_to confirm_path
    end
  end

  def confirm_checkout
    data = {
      "VendorId": params[:vid],
      "Notes": params[:notes]
    }
    createsale_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).CreateSale
    @thischeckout = JSON.parse(createsale_response.body, object_class: OpenStruct)
    redirect_to thankyou_path
  end

  def thankyou
    if current_user
      @raw_cartitems = get_cart_items
    end
  end
end
