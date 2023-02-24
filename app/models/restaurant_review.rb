class RestaurantReview < ApplicationRecord
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true, length: { maximum: 500 } 
  belongs_to :restaurant
  belongs_to :user
  after_create :update_restaurant_rating

  def update_restaurant_rating
    restaurant.average_rating
  end
end
