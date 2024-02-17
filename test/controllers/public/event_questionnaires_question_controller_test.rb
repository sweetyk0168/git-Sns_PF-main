require "test_helper"

class Public::EventQuestionnairesQuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_event_questionnaires_question_new_url
    assert_response :success
  end

  test "should get index" do
    get public_event_questionnaires_question_index_url
    assert_response :success
  end

  test "should get show" do
    get public_event_questionnaires_question_show_url
    assert_response :success
  end
end
