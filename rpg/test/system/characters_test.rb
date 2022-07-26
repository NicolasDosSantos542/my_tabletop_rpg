require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:one)
  end

  test "visiting the index" do
    visit characters_url
    assert_selector "h1", text: "Characters"
  end

  test "should create character" do
    visit characters_url
    click_on "New character"

    fill_in "Avatar", with: @character.avatar
    fill_in "Chapter", with: @character.chapter_id
    fill_in "Experience", with: @character.experience
    fill_in "Gold", with: @character.gold
    fill_in "Life", with: @character.life
    fill_in "Name", with: @character.name
    fill_in "Step", with: @character.step_id
    fill_in "Strength", with: @character.strength
    fill_in "Total life", with: @character.total_life
    fill_in "Total strength", with: @character.total_strength
    click_on "Create Character"

    assert_text "Character was successfully created"
    click_on "Back"
  end

  test "should update Character" do
    visit character_url(@character)
    click_on "Edit this character", match: :first

    fill_in "Avatar", with: @character.avatar
    fill_in "Chapter", with: @character.chapter_id
    fill_in "Experience", with: @character.experience
    fill_in "Gold", with: @character.gold
    fill_in "Life", with: @character.life
    fill_in "Name", with: @character.name
    fill_in "Step", with: @character.step_id
    fill_in "Strength", with: @character.strength
    fill_in "Total life", with: @character.total_life
    fill_in "Total strength", with: @character.total_strength
    click_on "Update Character"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "should destroy Character" do
    visit character_url(@character)
    click_on "Destroy this character", match: :first

    assert_text "Character was successfully destroyed"
  end
end
