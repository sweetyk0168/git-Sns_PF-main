class ChangeOptionEventTitleEventTickets < ActiveRecord::Migration[6.1]
  def change
    change_column_null :event_tickets, :event_title, false, ""
    change_column_default :event_tickets, :event_title, from: nil, to: ""
  end
end
