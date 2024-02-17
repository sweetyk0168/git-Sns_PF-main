require "test_helper"

class Public::CartTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_tickets_index_url
    assert_response :success
  end
end
