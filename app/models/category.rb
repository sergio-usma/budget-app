class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_movements, foreign_key: :category_id, dependent: :destroy
  has_many :movements, through: :category_movements, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :name, length: { maximum: 10 }
end
