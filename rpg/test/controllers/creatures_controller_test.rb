require "test_helper"

class CreaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creature = creatures(:one)
  end

  test "should get index" do
    get creatures_url
    assert_response :success
  end

  test "should get new" do
    get new_creature_url
    assert_response :success
  end

  test "should create creature" do
    assert_difference("Creature.count") do
      post creatures_url, params: { creature: { description: @creature.description, name: @creature.name } }
    end

    assert_redirected_to creature_url(Creature.last)
  end

  test "should show creature" do
    get creature_url(@creature)
    assert_response :success
  end

  test "should get edit" do
    get edit_creature_url(@creature)
    assert_response :success
  end

  test "should update creature" do
    patch creature_url(@creature), params: { creature: { description: @creature.description, name: @creature.name } }
    assert_redirected_to creature_url(@creature)
  end

  test "should destroy creature" do
    assert_difference("Creature.count", -1) do
      delete creature_url(@creature)
    end

    assert_redirected_to creatures_url
  end
end
