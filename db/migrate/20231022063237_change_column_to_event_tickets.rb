class ChangeColumnToEventTickets < ActiveRecord::Migration[6.1]
  def change
    change_column_null :event_tickets, :ticket_startday, false, ""
    change_column_null :event_tickets, :ticket_endday, false, ""
    change_column_null :event_tickets, :ticket_place, false, ""
  end
end
