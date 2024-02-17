class CartTicket < ApplicationRecord
  belongs_to :customer
  belongs_to :event_ticket

  validates :amount, presence:true
  validates :event_ticket_id, presence:true
  validates :customer_id, presence:true
end
