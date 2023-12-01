class Category < ApplicationRecord
  belongs_to :user
  has_many :category_movements, dependent: :destroy
  has_many :movements, through: :category_movements, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :name, length: { maximum: 10 }
end
