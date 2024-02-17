class RemoveGenreNameFromEventTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_tickets, :genre_name, :string
  end
end
