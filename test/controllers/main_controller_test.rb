require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get [index]" do
    get main_[index]_url
    assert_response :success
  end

end
