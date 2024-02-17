class TicketOrder < ApplicationRecord
  belongs_to :customer
  has_many :ticket_order_details, dependent: :destroy
  has_many :event_tickets, through: :ticket_order_details

  validates :customer_id, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true, numericality: [only_integer: true]
  validates :payment, presence: true, numericality: [only_integer: true]
  validates :payment_method, presence: true
  validates :order_status, presence: true

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1, 発送準備中:2,発送済み:3}
end
