class AddEventTitleToEventTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :event_tickets, :event_title, :string
  end
end
