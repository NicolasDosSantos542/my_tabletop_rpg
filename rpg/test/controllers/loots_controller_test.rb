require "test_helper"

class LootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loot = loots(:one)
  end

  test "should get index" do
    get loots_url
    assert_response :success
  end

  test "should get new" do
    get new_loot_url
    assert_response :success
  end

  test "should create loot" do
    assert_difference("Loot.count") do
      post loots_url, params: { loot: { exp: @loot.exp, image: @loot.image, life: @loot.life, strength: @loot.strength } }
    end

    assert_redirected_to loot_url(Loot.last)
  end

  test "should show loot" do
    get loot_url(@loot)
    assert_response :success
  end

  test "should get edit" do
    get edit_loot_url(@loot)
    assert_response :success
  end

  test "should update loot" do
    patch loot_url(@loot), params: { loot: { exp: @loot.exp, image: @loot.image, life: @loot.life, strength: @loot.strength } }
    assert_redirected_to loot_url(@loot)
  end

  test "should destroy loot" do
    assert_difference("Loot.count", -1) do
      delete loot_url(@loot)
    end

    assert_redirected_to loots_url
  end
end
