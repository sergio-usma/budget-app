class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :categories, foreign_key: :author_id, class_name: 'Category', dependent: :destroy
  has_many :movements, foreign_key: :author_id, class_name: 'Movement', dependent: :destroy, inverse_of: :author

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
end
