require "test_helper"

class GamePlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_player = game_players(:one)
  end

  test "should get index" do
    get game_players_url
    assert_response :success
  end

  test "should get new" do
    get new_game_player_url
    assert_response :success
  end

  test "should create game_player" do
    assert_difference("GamePlayer.count") do
      post game_players_url, params: { game_player: { game_id: @game_player.game_id, player_id: @game_player.player_id } }
    end

    assert_redirected_to game_player_url(GamePlayer.last)
  end

  test "should show game_player" do
    get game_player_url(@game_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_player_url(@game_player)
    assert_response :success
  end

  test "should update game_player" do
    patch game_player_url(@game_player), params: { game_player: { game_id: @game_player.game_id, player_id: @game_player.player_id } }
    assert_redirected_to game_player_url(@game_player)
  end

  test "should destroy game_player" do
    assert_difference("GamePlayer.count", -1) do
      delete game_player_url(@game_player)
    end

    assert_redirected_to game_players_url
  end
end
