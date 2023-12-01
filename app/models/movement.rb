class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :movements
  has_many :category_movements, dependent: :destroy
  has_many :categories, through: :category_movements

  validates :name, presence: true
  validates :amount, presence: true
  validates :category_ids, presence: true
end
