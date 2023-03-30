require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "should create member" do
    visit members_url
    click_on "New member"

    fill_in "Amount paid", with: @member.amount_paid
    fill_in "Car registration", with: @member.car_registration
    fill_in "Dob", with: @member.dob
    fill_in "Email", with: @member.email
    fill_in "Emergency contact", with: @member.emergency_contact
    fill_in "Make", with: @member.make
    fill_in "Model", with: @member.model
    fill_in "Name", with: @member.name
    fill_in "Payment code", with: @member.payment_code
    fill_in "Phone number", with: @member.phone_number
    fill_in "Registered time", with: @member.registered_time
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "should update Member" do
    visit member_url(@member)
    click_on "Edit this member", match: :first

    fill_in "Amount paid", with: @member.amount_paid
    fill_in "Car registration", with: @member.car_registration
    fill_in "Dob", with: @member.dob
    fill_in "Email", with: @member.email
    fill_in "Emergency contact", with: @member.emergency_contact
    fill_in "Make", with: @member.make
    fill_in "Model", with: @member.model
    fill_in "Name", with: @member.name
    fill_in "Payment code", with: @member.payment_code
    fill_in "Phone number", with: @member.phone_number
    fill_in "Registered time", with: @member.registered_time
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "should destroy Member" do
    visit member_url(@member)
    click_on "Destroy this member", match: :first

    assert_text "Member was successfully destroyed"
  end
end
