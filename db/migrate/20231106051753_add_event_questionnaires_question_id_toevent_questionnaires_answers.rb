class AddEventQuestionnairesQuestionIdToeventQuestionnairesAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :event_questionnaires_answers, :event_questionnaires_question_id, :integer
  end
end
