class AddTitleBodyToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :title, :string
    add_column :events, :body, :string
  end
end
