class ApplicationController < ActionController::Base
  before_action :set_template, :set_data
  helper_method :current_user, :xidentity
  theme :theme_resolver

  def set_data
    if !@market_org.nil?
      if !request.path.include? "admin"
        getvendors_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: ""}).GetVendors
        @raw_vendors = JSON.parse(getvendors_response.body, object_class: OpenStruct)
        # getvendors_response = File.read(File.join(Rails.public_path, 'GetVendors.json'))
        # @raw_vendors = JSON.parse(getvendors_response, object_class: OpenStruct)

        if params[:pi].present?
          pi_str = params[:pi]
        else
          pi_str = "1"
        end

        if params[:pz].present?
          pz_str = params[:pz]
        else
          pz_str = "32"
        end

        if params[:search].present?
          search_str = params[:search]
        else
          search_str = ""
        end

        if params[:rg].present?
          rg_str = params[:rg]
        else
          rg_str = ""
        end

        if params[:vid].present?
          vid_str = params[:vid]
        elsif params[:id].present?
          if params[:id] != "search"
            vid_str = params[:id] + "." + params[:format]
          end
        elsif controller_name == "pages"
          vid_str = "616810769074.65607"
        else
          vid_str = ""
        end

        data = {
          :PageNumber => pi_str,
          :PageSize => pz_str,
          :SearchCriteria => search_str,
          :RepGroupId => rg_str,
          :VendorId => vid_str
        }

        getcatalogitems_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).GetCatalogItems
        @raw_products = JSON.parse(getcatalogitems_response.body, object_class: OpenStruct)

        if current_user
          @raw_cartitems = get_cart_items
        end
        @vendors = @raw_vendors.v
        @products = @raw_products.i
      end
    end
  end

  def set_template
    @market_org = MarketOrg.find_by(domain: request.domain)
    if @market_org == nil
      @market_org = MarketOrg.find_by(domain: "")
    end
  end


  def theme_resolver
    if request.path.include? "admin"
      params[:theme] ||= "Admin"
    elsif @market_org.theme == nil
      params[:theme] ||= "Alia"
    else
      params[:theme] ||= @market_org.theme
    end
  end

  def current_user
    if session[:user_email]
      @current_user ||= session[:user_email]
    else
      @current_user = nil
    end
  end

  def xidentity
    if current_user
      return @market_org.repdesk_token.to_s + "^^" + current_user
    else
      return @market_org.repdesk_token.to_s
    end
  end

  def get_cart_items
    data = {
      :v => params[:vid]
    }
    getcartitems_response = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).Restore
    return JSON.parse(getcartitems_response.body, object_class: OpenStruct)
  end

end
