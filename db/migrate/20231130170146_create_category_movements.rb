class CreateCategoryMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :category_movements do |t|
      t.references :category, foreign_key: true
      t.references :movement, foreign_key: true

      t.timestamps
    end
  end
end
