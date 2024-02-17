class ChangeOptionUrlStringsToEvents < ActiveRecord::Migration[6.1]
  def change
    change_column_null :events, :url_strings, false, ""
    change_column_default :events, :url_strings, from: nil, to: ""
  end
end
