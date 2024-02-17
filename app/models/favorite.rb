class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :customer
  has_one :notification, as: :subject, dependent: :destroy

  validates :customer_id, presence: true, uniqueness: {scope: :post_id}
  validates :post_id, presence: true

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create!(subject: self, customer: post.customer, action_type: :favorited_to_own_post)
  end
end