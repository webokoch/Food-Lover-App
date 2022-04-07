class FoodRestaurantsController < ApplicationController
  before_action :set_food

  def create
    @food_restaurant = FoodRestaurant.new(food: @food, food_restaurant_params)
    @food_restaurant.user = current_user
    @food_restaurant.save
  end

  private

  def set_food
    @food = Food.find(params[:food_id])
  end

  def food_restaurant_params
    params.require(:food_restaurant).permit(restaurant_id:)
  end
end
