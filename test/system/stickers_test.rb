require "application_system_test_case"

class StickersTest < ApplicationSystemTestCase
  setup do
    @sticker = stickers(:one)
  end

  test "visiting the index" do
    visit stickers_url
    assert_selector "h1", text: "Stickers"
  end

  test "should create sticker" do
    visit stickers_url
    click_on "New sticker"

    fill_in "Member", with: @sticker.member_id
    fill_in "Sticker number", with: @sticker.sticker_number
    fill_in "Sticker variation", with: @sticker.sticker_variation
    click_on "Create Sticker"

    assert_text "Sticker was successfully created"
    click_on "Back"
  end

  test "should update Sticker" do
    visit sticker_url(@sticker)
    click_on "Edit this sticker", match: :first

    fill_in "Member", with: @sticker.member_id
    fill_in "Sticker number", with: @sticker.sticker_number
    fill_in "Sticker variation", with: @sticker.sticker_variation
    click_on "Update Sticker"

    assert_text "Sticker was successfully updated"
    click_on "Back"
  end

  test "should destroy Sticker" do
    visit sticker_url(@sticker)
    click_on "Destroy this sticker", match: :first

    assert_text "Sticker was successfully destroyed"
  end
end
