require "test_helper"

class Admin::EventQuestionnairesQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_event_questionnaires_questions_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_event_questionnaires_questions_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_questionnaires_questions_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_event_questionnaires_questions_index_url
    assert_response :success
  end
end
