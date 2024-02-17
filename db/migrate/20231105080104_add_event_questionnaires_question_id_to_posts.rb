class AddEventQuestionnairesQuestionIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :event_questionnaires_question_id, :integer
  end
end
