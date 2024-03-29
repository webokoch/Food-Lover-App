class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, dependent: :destroy
  has_many :food_reviews, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_many :restaurant_reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
end
