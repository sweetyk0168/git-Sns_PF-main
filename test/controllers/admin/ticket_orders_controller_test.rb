require "test_helper"

class Admin::TicketOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ticket_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_ticket_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_ticket_orders_new_url
    assert_response :success
  end
end
