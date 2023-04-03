require "test_helper"

class CartDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_details_create_url
    assert_response :success
  end

  test "should get update" do
    get cart_details_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_details_destroy_url
    assert_response :success
  end
end
