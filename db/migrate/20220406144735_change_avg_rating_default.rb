class ChangeAvgRatingDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:foods, :avg_rating, 0)
  end
end
