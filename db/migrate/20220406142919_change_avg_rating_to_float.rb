class ChangeAvgRatingToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :foods, :avg_rating, :float
  end
end
