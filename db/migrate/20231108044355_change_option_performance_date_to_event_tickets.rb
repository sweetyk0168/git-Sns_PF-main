class ChangeOptionPerformanceDateToEventTickets < ActiveRecord::Migration[6.1]
  def change
    change_column_null :event_tickets, :performance_date, false, ""
    change_column_default :event_tickets, :performance_date, from: nil, to: ""
  end
end
