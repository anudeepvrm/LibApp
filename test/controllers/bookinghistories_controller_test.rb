require 'test_helper'

class BookinghistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookinghistory = bookinghistories(:one)
  end

  test "should get index" do
    get bookinghistories_url
    assert_response :success
  end

  test "should get new" do
    get new_bookinghistory_url
    assert_response :success
  end

  test "should create bookinghistory" do
    assert_difference('Bookinghistory.count') do
      post bookinghistories_url, params: { bookinghistory: {  } }
    end

    assert_redirected_to bookinghistory_url(Bookinghistory.last)
  end

  test "should show bookinghistory" do
    get bookinghistory_url(@bookinghistory)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookinghistory_url(@bookinghistory)
    assert_response :success
  end

  test "should update bookinghistory" do
    patch bookinghistory_url(@bookinghistory), params: { bookinghistory: {  } }
    assert_redirected_to bookinghistory_url(@bookinghistory)
  end

  test "should destroy bookinghistory" do
    assert_difference('Bookinghistory.count', -1) do
      delete bookinghistory_url(@bookinghistory)
    end

    assert_redirected_to bookinghistories_url
  end
end
