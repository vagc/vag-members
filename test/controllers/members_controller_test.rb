require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference("Member.count") do
      post members_url, params: { member: { amount_paid: @member.amount_paid, car_registration: @member.car_registration, dob: @member.dob, email: @member.email, emergency_contact: @member.emergency_contact, make: @member.make, model: @member.model, name: @member.name, payment_code: @member.payment_code, phone_number: @member.phone_number, registered_time: @member.registered_time } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { amount_paid: @member.amount_paid, car_registration: @member.car_registration, dob: @member.dob, email: @member.email, emergency_contact: @member.emergency_contact, make: @member.make, model: @member.model, name: @member.name, payment_code: @member.payment_code, phone_number: @member.phone_number, registered_time: @member.registered_time } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference("Member.count", -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
