class EventQuestionnairesAnswer < ApplicationRecord
  belongs_to :event_questionnaires_question, optional: true
  belongs_to :customer, optional: true

  validates :gender, presence: true
  # validates :reason, presence: true
  validates :satisfaction, presence: true
  # validates :reason_for_satisfaction, presence: true
  validates :participation, presence: true
  # validates :impressions, presence: true

  enum gender: {男:1, 女:2}
  enum participation: {参加したい:1, 参加したくない:2}
  enum satisfaction: {１:1, ２:2, ３:3, ４:4, ５:5, ６:6, ７:7, ８:8, ９:9, １０:10}

  def event_questionnaires_question
    return EventQuestionnairesQuestion.find_by(id: self.event_questionnaires_question_id)
  end
end
