class CreateFoodReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :food_reviews do |t|
      t.integer :rating
      t.text :content
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
