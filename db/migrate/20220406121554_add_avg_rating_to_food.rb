class AddAvgRatingToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :avg_rating, :integer
  end
end
