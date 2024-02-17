class EventTicket < ApplicationRecord
  belongs_to :event
  has_many :cart_tickets, dependent: :destroy
  has_many :ticket_orders, through: :ticket_order_details
  has_many :ticket_order_details, dependent: :destroy

  validates :event_title, presence: true
  validates :ticket_startday, presence: true
  validates :ticket_endday, presence: true
  validates :ticket_place,  presence: true
  validates :ticket_name, presence: true
  validates :ticket_introduction, presence: true
  validates :ticket_price, presence: true
  validates :sales_status, inclusion:[true, false]
  validates :performance_date, presence: true

  def add_tax_ticket_price
    (self.ticket_price * 1.10).round
  end
end