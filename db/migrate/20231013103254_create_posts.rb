class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
