require "test_helper"

class Admin::EventTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_event_tickets_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_event_tickets_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_tickets_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_event_tickets_edit_url
    assert_response :success
  end
end
