class RemoveBodyFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :body, :string
  end
end
