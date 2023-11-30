class User < ApplicationRecord
  has_many :categories, foreign_key: :author_id, class_name: 'Category'
  has_many :movements, foreign_key: :author_id, class_name: 'Movement'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
