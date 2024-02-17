require "test_helper"

class Public::EventTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_event_tickets_index_url
    assert_response :success
  end

  test "should get show" do
    get public_event_tickets_show_url
    assert_response :success
  end
end
