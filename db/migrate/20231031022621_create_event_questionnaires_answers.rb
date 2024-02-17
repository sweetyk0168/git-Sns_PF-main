class CreateEventQuestionnairesAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_questionnaires_answers do |t|
      t.integer  :gender, null: false
      t.text     :reason, null: false
      t.integer  :satisfaction, null: false
      t.text     :reason_for_satisfaction, null: false
      t.integer  :participation,  null: false
      t.text     :impressions, null: false
      t.timestamps
    end
  end
end
