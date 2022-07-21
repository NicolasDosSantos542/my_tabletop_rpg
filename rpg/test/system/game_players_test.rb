require "application_system_test_case"

class GamePlayersTest < ApplicationSystemTestCase
  setup do
    @game_player = game_players(:one)
  end

  test "visiting the index" do
    visit game_players_url
    assert_selector "h1", text: "Game players"
  end

  test "should create game player" do
    visit game_players_url
    click_on "New game player"

    fill_in "Game", with: @game_player.game_id
    fill_in "Player", with: @game_player.player_id
    click_on "Create Game player"

    assert_text "Game player was successfully created"
    click_on "Back"
  end

  test "should update Game player" do
    visit game_player_url(@game_player)
    click_on "Edit this game player", match: :first

    fill_in "Game", with: @game_player.game_id
    fill_in "Player", with: @game_player.player_id
    click_on "Update Game player"

    assert_text "Game player was successfully updated"
    click_on "Back"
  end

  test "should destroy Game player" do
    visit game_player_url(@game_player)
    click_on "Destroy this game player", match: :first

    assert_text "Game player was successfully destroyed"
  end
end
