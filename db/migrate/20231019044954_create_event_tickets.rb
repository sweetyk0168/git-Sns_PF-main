class CreateEventTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :event_tickets do |t|
      t.integer :genre_id, null: false
      t.string  :ticket_name, null: false
      t.text    :ticket_introduction, null:false
      t.integer :ticket_price, null:false
      # t.integer :amount, null:false
      t.boolean :sales_status, null:false, default: true
      t.timestamps
    end
  end
end
