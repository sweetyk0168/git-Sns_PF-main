class AddGenreNameToEventTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :event_tickets, :genre_name, :string
  end
end
