class AddDaysToEventTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :event_tickets, :ticket_startday, :string
    add_column :event_tickets, :ticket_endday, :string
    add_column :event_tickets, :ticket_place, :string
  end
end
