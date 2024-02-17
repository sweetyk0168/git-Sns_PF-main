class AddUrlStringsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :url_strings, :string
  end
end
