class FoodRestaurantsController < ApplicationController
  before_action :set_food

  def new
    @food_restaurant = FoodRestaurant.new
  end
  
  def create
    @food_restaurant = FoodRestaurant.new(food_id: params[:food_id], restaurant_id: food_restaurant_params[:restaurant_id])
    if @food_restaurant.save
      redirect_to food_path(@food)
    else
      render :new
    end
  end

  private

  def set_food
    @food = Food.find(params[:food_id])
  end

  def food_restaurant_params
    params.require(:food_restaurant).permit(:restaurant_id)
  end
end