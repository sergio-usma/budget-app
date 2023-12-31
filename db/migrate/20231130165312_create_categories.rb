class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
