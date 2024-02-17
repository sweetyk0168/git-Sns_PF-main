class CreateTicketOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_order_details do |t|
      t.integer :event_ticket_id, null:false
      t.integer :ticket_order_id, null:false
      t.integer :amount, null:false
      t.integer :price, null:false
      t.integer :ticket_status, default: 0
      t.timestamps
    end
  end
end
