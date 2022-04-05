class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cuisine, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  belongs_to :user

include PgSearch::Model
multisearchable against: [:name, :cuisine, :location]
end
