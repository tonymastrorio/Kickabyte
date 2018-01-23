require 'test_helper'

class QupvoteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get qupvote_create_url
    assert_response :success
  end

  test "should get destroy" do
    get qupvote_destroy_url
    assert_response :success
  end

end
