class Admin::MarketOrgsController < ApplicationController
  before_action :set_market_org, only: [:show, :edit, :update, :destroy]

  # GET /admin/market_orgs
  # GET /admin/market_orgs.json
  def index
    @market_orgs = MarketOrg.all
  end

  # GET /admin/market_orgs/1
  # GET /admin/market_orgs/1.json
  def show
  end

  # GET /admin/market_orgs/new
  def new
    @market_org = MarketOrg.new
    @list_of_themes = get_theme_list
  end

  # GET /admin/market_orgs/1/edit
  def edit
    @list_of_themes = get_theme_list
  end

  # POST /admin/market_orgs
  # POST /admin/market_orgs.json
  def create
    @market_org = MarketOrg.new(market_org_params)

    respond_to do |format|
      if @market_org.save
        format.html { redirect_to admin_market_orgs_url, notice: 'Market org was successfully created.' }
        format.json { render :show, status: :created, location: @market_org }
      else
        format.html { render :new }
        format.json { render json: @market_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/market_orgs/1
  # PATCH/PUT /admin/market_orgs/1.json
  def update
    respond_to do |format|
      if @market_org.update(market_org_params)
        format.html { redirect_to admin_market_orgs_url, notice: 'Market org was successfully updated.' }
        format.json { render :show, status: :ok, location: @market_org }
      else
        format.html { render :edit }
        format.json { render json: @market_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/market_orgs/1
  # DELETE /admin/market_orgs/1.json
  def destroy
    @market_org.destroy
    respond_to do |format|
      format.html { redirect_to admin_market_orgs_url, notice: 'Market org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_org
      @market_org = MarketOrg.find(params[:id])
    end

    def get_theme_list
      theme_dir_path = Rails.root.join('app', 'themes').to_s + '/'
      theme_dir = Rails.root.join('app', 'themes', '*')
      return Dir[theme_dir].map{ |e| e.gsub(theme_dir_path, '') }.delete_if {|x| x == "Admin" }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_org_params
      params.require(:market_org).permit(:repdesk_token, :api_url, :rep_group, :theme, :domain)
    end
end
