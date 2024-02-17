class ChangeOptionTitleToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :title, false, ""
    change_column_default :posts, :title, from: nil, to: ""
  end
end
