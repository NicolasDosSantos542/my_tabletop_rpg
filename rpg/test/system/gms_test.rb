require "application_system_test_case"

class GmsTest < ApplicationSystemTestCase
  setup do
    @gm = gms(:one)
  end

  test "visiting the index" do
    visit gms_url
    assert_selector "h1", text: "Gms"
  end

  test "should create gm" do
    visit gms_url
    click_on "New gm"

    fill_in "Login", with: @gm.login
    fill_in "Password", with: @gm.password
    click_on "Create Gm"

    assert_text "Gm was successfully created"
    click_on "Back"
  end

  test "should update Gm" do
    visit gm_url(@gm)
    click_on "Edit this gm", match: :first

    fill_in "Login", with: @gm.login
    fill_in "Password", with: @gm.password
    click_on "Update Gm"

    assert_text "Gm was successfully updated"
    click_on "Back"
  end

  test "should destroy Gm" do
    visit gm_url(@gm)
    click_on "Destroy this gm", match: :first

    assert_text "Gm was successfully destroyed"
  end
end
