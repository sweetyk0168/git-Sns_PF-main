class EventQuestionnairesQuestion < ApplicationRecord
  has_many :event_questionnaires_answers
  has_many :posts, dependent: :destroy

  validates :title,presence: true
  validates :content,presence: true
end
