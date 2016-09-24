require 'test_helper'

class BookedroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookedroom = bookedrooms(:one)
  end

  test "should get index" do
    get bookedrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_bookedroom_url
    assert_response :success
  end

  test "should create bookedroom" do
    assert_difference('Bookedroom.count') do
      post bookedrooms_url, params: { bookedroom: { building: @bookedroom.building, roomno: @bookedroom.roomno, size: @bookedroom.size, status: @bookedroom.status } }
    end

    assert_redirected_to bookedroom_url(Bookedroom.last)
  end

  test "should show bookedroom" do
    get bookedroom_url(@bookedroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookedroom_url(@bookedroom)
    assert_response :success
  end

  test "should update bookedroom" do
    patch bookedroom_url(@bookedroom), params: { bookedroom: { building: @bookedroom.building, roomno: @bookedroom.roomno, size: @bookedroom.size, status: @bookedroom.status } }
    assert_redirected_to bookedroom_url(@bookedroom)
  end

  test "should destroy bookedroom" do
    assert_difference('Bookedroom.count', -1) do
      delete bookedroom_url(@bookedroom)
    end

    assert_redirected_to bookedrooms_url
  end
end
