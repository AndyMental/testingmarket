require "application_system_test_case"

class Admin::MarketOrgsTest < ApplicationSystemTestCase
  setup do
    @admin_market_org = admin_market_orgs(:one)
  end

  test "visiting the index" do
    visit admin_market_orgs_url
    assert_selector "h1", text: "Admin/Market Orgs"
  end

  test "creating a Market org" do
    visit admin_market_orgs_url
    click_on "New Admin/Market Org"

    fill_in "Api url", with: @admin_market_org.api_url
    fill_in "Domain", with: @admin_market_org.domain
    fill_in "Rep group", with: @admin_market_org.rep_group
    fill_in "Repdesk token", with: @admin_market_org.repdesk_token
    fill_in "Theme", with: @admin_market_org.theme
    click_on "Create Market org"

    assert_text "Market org was successfully created"
    click_on "Back"
  end

  test "updating a Market org" do
    visit admin_market_orgs_url
    click_on "Edit", match: :first

    fill_in "Api url", with: @admin_market_org.api_url
    fill_in "Domain", with: @admin_market_org.domain
    fill_in "Rep group", with: @admin_market_org.rep_group
    fill_in "Repdesk token", with: @admin_market_org.repdesk_token
    fill_in "Theme", with: @admin_market_org.theme
    click_on "Update Market org"

    assert_text "Market org was successfully updated"
    click_on "Back"
  end

  test "destroying a Market org" do
    visit admin_market_orgs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Market org was successfully destroyed"
  end
end
