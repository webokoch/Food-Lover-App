class FoodReview < ApplicationRecord
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true, length: { maximum: 500 } 
  belongs_to :food
end
