class CreateCategoryMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :category_movements do |t|
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :movements, null: false, foreign_key: { to_table: :movements }

      t.timestamps
    end
  end
end
