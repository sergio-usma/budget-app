class CategoryMovement < ApplicationRecord
  belongs_to :category
  belongs_to :movement
end
