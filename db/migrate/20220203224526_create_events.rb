class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :day, null: false
      t.string :hour, null: false
      t.string :link, null: false
      t.bigint :user_id, null: false
      t.bigint :category_id, null: false

      t.timestamps
    end
    add_index :events, [:link, :user_id, :category_id], unique: true
    add_foreign_key :events, :users, column: :user_id
    add_foreign_key :events, :categories, column: :category_id
  end
end
