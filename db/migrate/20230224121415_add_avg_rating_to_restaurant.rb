class AddAvgRatingToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :avg_rating, :float, default: 0
  end
end
