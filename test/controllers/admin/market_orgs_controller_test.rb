require 'test_helper'

class Admin::MarketOrgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_market_org = admin_market_orgs(:one)
  end

  test "should get index" do
    get admin_market_orgs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_market_org_url
    assert_response :success
  end

  test "should create admin_market_org" do
    assert_difference('Admin::MarketOrg.count') do
      post admin_market_orgs_url, params: { admin_market_org: { api_url: @admin_market_org.api_url, domain: @admin_market_org.domain, rep_group: @admin_market_org.rep_group, repdesk_token: @admin_market_org.repdesk_token, theme: @admin_market_org.theme } }
    end

    assert_redirected_to admin_market_org_url(Admin::MarketOrg.last)
  end

  test "should show admin_market_org" do
    get admin_market_org_url(@admin_market_org)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_market_org_url(@admin_market_org)
    assert_response :success
  end

  test "should update admin_market_org" do
    patch admin_market_org_url(@admin_market_org), params: { admin_market_org: { api_url: @admin_market_org.api_url, domain: @admin_market_org.domain, rep_group: @admin_market_org.rep_group, repdesk_token: @admin_market_org.repdesk_token, theme: @admin_market_org.theme } }
    assert_redirected_to admin_market_org_url(@admin_market_org)
  end

  test "should destroy admin_market_org" do
    assert_difference('Admin::MarketOrg.count', -1) do
      delete admin_market_org_url(@admin_market_org)
    end

    assert_redirected_to admin_market_orgs_url
  end
end
