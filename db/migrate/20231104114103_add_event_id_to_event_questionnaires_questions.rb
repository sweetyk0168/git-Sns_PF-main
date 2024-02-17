class AddEventIdToEventQuestionnairesQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :event_questionnaires_questions, :event_id, :integer
  end
end
