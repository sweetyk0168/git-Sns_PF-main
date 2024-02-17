class Genre < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :event_tickets, dependent: :destroy
  has_many :event_repos, dependent: :destroy
  has_many :event_questionnaires, dependent: :destroy

  validates :name, presence: true
end
