class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :categories, foreign_key: :author_id, class_name: 'Category'
  has_many :movements, foreign_key: :author_id, class_name: 'Movement'

  validates :name, presence: true
end
