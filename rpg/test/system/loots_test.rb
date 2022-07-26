require "application_system_test_case"

class LootsTest < ApplicationSystemTestCase
  setup do
    @loot = loots(:one)
  end

  test "visiting the index" do
    visit loots_url
    assert_selector "h1", text: "Loots"
  end

  test "should create loot" do
    visit loots_url
    click_on "New loot"

    fill_in "Exp", with: @loot.exp
    fill_in "Image", with: @loot.image
    fill_in "Life", with: @loot.life
    fill_in "Strength", with: @loot.strength
    click_on "Create Loot"

    assert_text "Loot was successfully created"
    click_on "Back"
  end

  test "should update Loot" do
    visit loot_url(@loot)
    click_on "Edit this loot", match: :first

    fill_in "Exp", with: @loot.exp
    fill_in "Image", with: @loot.image
    fill_in "Life", with: @loot.life
    fill_in "Strength", with: @loot.strength
    click_on "Update Loot"

    assert_text "Loot was successfully updated"
    click_on "Back"
  end

  test "should destroy Loot" do
    visit loot_url(@loot)
    click_on "Destroy this loot", match: :first

    assert_text "Loot was successfully destroyed"
  end
end
