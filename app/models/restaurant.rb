class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cuisine, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  has_one_attached :photo
  belongs_to :user
  has_many :restaurant_reviews, dependent: :destroy
  has_many :food_restaurants, dependent: :destroy
  has_many :foods, through: :food_restaurants

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  include PgSearch::Model
  multisearchable against: [:name, :cuisine, :location, :description]

  def average_rating
    if restaurant_reviews.exists?
      @avg = restaurant_reviews.average(:rating).round(2)
      update_attributes(avg_rating: @avg)
    else
      'undefined'
    end
  end

  def avg_rating_percentage 
    avg_rating.round(1).to_f*100/5
  end
end
