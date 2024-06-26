require "test_helper"

class StickersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sticker = stickers(:one)
  end

  test "should get index" do
    get stickers_url
    assert_response :success
  end

  test "should get new" do
    get new_sticker_url
    assert_response :success
  end

  test "should create sticker" do
    assert_difference("Sticker.count") do
      post stickers_url, params: { sticker: { member_id: @sticker.member_id, sticker_number: @sticker.sticker_number, sticker_variation: @sticker.sticker_variation } }
    end

    assert_redirected_to sticker_url(Sticker.last)
  end

  test "should show sticker" do
    get sticker_url(@sticker)
    assert_response :success
  end

  test "should get edit" do
    get edit_sticker_url(@sticker)
    assert_response :success
  end

  test "should update sticker" do
    patch sticker_url(@sticker), params: { sticker: { member_id: @sticker.member_id, sticker_number: @sticker.sticker_number, sticker_variation: @sticker.sticker_variation } }
    assert_redirected_to sticker_url(@sticker)
  end

  test "should destroy sticker" do
    assert_difference("Sticker.count", -1) do
      delete sticker_url(@sticker)
    end

    assert_redirected_to stickers_url
  end
end
