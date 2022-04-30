class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cuisine, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  has_one_attached :photo
  belongs_to :user
  has_many :foods, through: :food_restaurants
  has_many :food_restaurants, dependent: :destroy


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  include PgSearch::Model
  multisearchable against: [:name, :cuisine, :location]
end
