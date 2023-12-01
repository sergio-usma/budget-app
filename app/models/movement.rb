class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, inverse_of: :movements
  has_many :category_movements, foreign_key: :movements_id, dependent: :destroy
  has_many :categories, through: :category_movements

  validates :name, presence: true
  validates :amount, numericality: { grater_than: 0 }
  validates :category_ids, presence: true
end
