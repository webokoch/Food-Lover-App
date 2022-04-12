class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
  end

  def users_restaurants
    @restaurants = Restaurant.where(user_id: current_user)
    authorize @restaurants
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to users_restaurants_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to users_restaurants_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to users_restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :location, :description)
  end
end
