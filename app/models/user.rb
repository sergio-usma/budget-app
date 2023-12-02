class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :categories, dependent: :destroy
  has_many :movements, foreign_key: :author_id, dependent: :destroy, inverse_of: :author

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
end
