class Food < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cuisine, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  belongs_to :user
  has_one_attached :photo
  has_many :food_reviews, dependent: :destroy
  has_many :food_restaurants, dependent: :destroy
  has_many :restaurants, through: :food_restaurants
  has_many :likes, dependent: :destroy

  include PgSearch::Model
  multisearchable against: [:name, :cuisine]

  def average_rating
    if food_reviews.exists?
      @avg = food_reviews.average(:rating).round(2)
      update_attributes(avg_rating: @avg)
    else
      'undefined'
    end
  end

  def avg_rating_percentage 
    avg_rating.round(1).to_f*100/5
  end
end
