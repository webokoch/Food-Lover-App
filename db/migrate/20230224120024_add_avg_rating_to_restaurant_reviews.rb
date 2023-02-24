class AddAvgRatingToRestaurantReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurant_reviews, :avg_rating, :float, default:0
  end
end
