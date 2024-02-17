class AddEventIDsToGoods < ActiveRecord::Migration[6.1]
  def change
    add_column :goods, :event_id, :integer
  end
end
