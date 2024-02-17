class ChangeOptionTitleBodyToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :title, false, ""
    change_column_default :posts, :title, from: nil, to: ""
    change_column_null :posts, :body, false, ""
    change_column_default :posts, :body, from: nil, to: ""
  end
end
