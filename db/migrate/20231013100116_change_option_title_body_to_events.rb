class ChangeOptionTitleBodyToEvents < ActiveRecord::Migration[6.1]
  def change
    change_column_null :events, :title, false, ""
    change_column_default :events, :title, from: nil, to: ""
    change_column_null :events, :body, false, ""
    change_column_default :events, :body, from: nil, to: ""
  end
end
