class SessionsController < ApplicationController
  def new
  end

  def create
    data = {
      :Email => params[:session][:email],
      :Pswd => params[:session][:password]
    }
    getUserAuthenticated = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).Authenticate
    getUserAuthenticated_response = JSON.parse(getUserAuthenticated.body)
    if getUserAuthenticated_response["brs"]
      session[:user_email] = params[:session][:email]
      redirect_to params[:session][:ref_uri], notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end 
  end

  def register
  end

  def recovery
  end

  def account
  end

  def send_registration_request
    data = {
      :Company => params[:company],
      :Fname => params[:fname],
      :Lname => params[:lname],
      :Email => params[:email],
      :Tel => params[:tel],
      :TaxId => params[:taxid],
      :Addr => params[:addr],
      :City => params[:city],
      :State => params[:state],
      :Zip => params[:zip],
      :Password => params[:password]
    }
    getRegistrationRequest = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).Register
    getRegistration_response = JSON.parse(getRegistrationRequest.body)
    if getRegistration_response["brs"]
      redirect_to params[:ref_uri], notice: "User registration request received: Kindly allow 24 hrs to confirm your request."
    else
      flash.now[:alert] = "Invalid Request"
      render "register"
    end
  end

  def send_recovery_request
    data = {
      :Email => params[:email],
    }
    getRecoveryRequest = MarketAPI.new({baseurl: @market_org.api_url.to_s, xidentity: xidentity, data: data}).PasswordRecover
    getRecoveryRequest_response = JSON.parse(getRecoveryRequest.body)
    if getRecoveryRequest_response["brs"]
      redirect_to params[:ref_uri], notice: "Password reset request received, please check your email."
    else
      flash.now[:alert] = "Invalid Request"
      render "recovery"
    end
  end

  def send_password_change_request
  end

  def destroy
    session[:user_email] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
