class FoodReview < ApplicationRecord
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true, length: { maximum: 500 } 
  belongs_to :food
  belongs_to :user
  after_create :update_food_rating

  def update_food_rating
    food.average_rating
  end
end
