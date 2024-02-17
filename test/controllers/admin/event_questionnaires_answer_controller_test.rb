require "test_helper"

class Admin::EventQuestionnairesAnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_event_questionnaires_answer_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_event_questionnaires_answer_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_questionnaires_answer_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_event_questionnaires_answer_edit_url
    assert_response :success
  end
end
