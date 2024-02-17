class CreateEvents < ActiveRecord::Migration[6.1]
    def change
      create_table :events do |t|
        t.integer :genre_id, null:false
        t.string :name, null:false
        t.text :introduction, null:false
        t.boolean :post_status, null:false, default: true
        t.timestamps
    end
  end
end
