class ChangeEventTicketRemoveGenreId < ActiveRecord::Migration[6.1]
  def up
      add_column :event_tickets, :event_id, :integer
      remove_column :event_tickets, :genre_id, :integer
  end

  def down
      remove_column :event_tickets, :event_id, :integer
      add_column :event_tickets, :genre_id, :integer
  end
end