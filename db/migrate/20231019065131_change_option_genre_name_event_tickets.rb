class ChangeOptionGenreNameEventTickets < ActiveRecord::Migration[6.1]
  def change
    change_column_null :event_tickets, :genre_name, false, ""
    change_column_default :event_tickets, :genre_name, from: nil, to: ""
  end
end
