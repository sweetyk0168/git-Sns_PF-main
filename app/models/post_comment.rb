class PostComment < ApplicationRecord
    belongs_to :customer
    belongs_to :post
    has_one :notification, as: :subject, dependent: :destroy

    validates :comment, presence: true

    after_create_commit :create_notifications

    private

    def create_notifications
        Notification.create!(subject: self, customer: post.customer, action_type: :commented_to_own_post)
    end
end
