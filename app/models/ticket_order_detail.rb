class TicketOrderDetail < ApplicationRecord
  belongs_to :ticket_order
  belongs_to :event_ticket

  validates :event_ticket_id, presence:true
  validates :ticket_order_id, presence:true
  validates :amount, presence:true, numericality: {only_integer: true}
  validates :price,  presence:true, numericality: {only_integer: true}

  enum ticket_status: {"着手負荷":0 ,"チケット手配中":1, "チケット手配完了":2}
end