class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.integer :genre_id, null:false
      t.string :name, null:false
      t.text :introduction, null:false
      t.boolean :post_status, default: true, null:false
      t.timestamps
    end
  end
end
