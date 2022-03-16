class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title, null:false 
      t.string :description
      t.date :date, null:false 
      t.string :link, null:false 
      t.bigint :user_id, null:false 
      t.bigint :category_id, null:false 

      t.timestamps
    end
    add_index :videos, [:link, :user_id], unique:true
    add_foreign_key :videos , :users, column: :user_id
    add_foreign_key :videos , :categories, column: :category_id
  end
end
