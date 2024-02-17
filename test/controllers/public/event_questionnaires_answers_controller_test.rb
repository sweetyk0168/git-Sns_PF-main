require "test_helper"

class Public::EventQuestionnairesAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_event_questionnaires_answers_new_url
    assert_response :success
  end
end
