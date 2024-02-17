class AddPerformanceDateToEventTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :event_tickets, :performance_date, :string
  end
end
