class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.bigint :category_id, null: false

      t.timestamps
    end
    add_index :preferences, [:category_id], unique: true
    add_foreign_key :preferences, :categories, column: :category_id
  end
end
