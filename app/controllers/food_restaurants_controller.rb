class FoodRestaurantsController < ApplicationController
  
  def create
    if params[:food_id]
      find_food()
      @food_restaurant = FoodRestaurant.new(food_id: params[:food_id], restaurant_id: food_restaurant_params[:restaurant_id])
      authorize @food_restaurant
      @food_restaurant.save
      redirect_to food_path(@food)
    elsif params[:restaurant_id]
      find_restaurant()
      @food_restaurant = FoodRestaurant.new(restaurant_id: params[:restaurant_id], food_id: food_restaurant_params[:food_id])
      authorize @food_restaurant
      @food_restaurant.save
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def food_restaurant_params
    params.require(:food_restaurant).permit(:restaurant_id, :food_id)
  end

  def find_food
    @food = Food.find(params[:food_id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
