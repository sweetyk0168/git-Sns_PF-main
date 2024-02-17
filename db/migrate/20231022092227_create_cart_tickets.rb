class CreateCartTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_tickets do |t|
      t.integer :event_ticket_id, null:false
      t.integer :customer_id, null:false
      t.integer :amount, null:false
      t.timestamps
    end
  end
end
