require "test_helper"

class GmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gm = gms(:one)
  end

  test "should get index" do
    get gms_url
    assert_response :success
  end

  test "should get new" do
    get new_gm_url
    assert_response :success
  end

  test "should create gm" do
    assert_difference("Gm.count") do
      post gms_url, params: { gm: { login: @gm.login, password: @gm.password } }
    end

    assert_redirected_to gm_url(Gm.last)
  end

  test "should show gm" do
    get gm_url(@gm)
    assert_response :success
  end

  test "should get edit" do
    get edit_gm_url(@gm)
    assert_response :success
  end

  test "should update gm" do
    patch gm_url(@gm), params: { gm: { login: @gm.login, password: @gm.password } }
    assert_redirected_to gm_url(@gm)
  end

  test "should destroy gm" do
    assert_difference("Gm.count", -1) do
      delete gm_url(@gm)
    end

    assert_redirected_to gms_url
  end
end
