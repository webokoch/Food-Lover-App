class FoodRestaurantsController < ApplicationController
  
  def create
    @food = Food.find(params[:food_id])
    @food_restaurant = FoodRestaurant.new(food_id: params[:food_id], restaurant_id: food_restaurant_params[:restaurant_id])
    authorize @food_restaurant
    @food_restaurant.save
    redirect_to food_path(@food)
  end

  private

  def food_restaurant_params
    params.require(:food_restaurant).permit(:restaurant_id)
  end
end