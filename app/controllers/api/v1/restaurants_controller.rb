class Api::V1::RestaurantsController < Api::V1::BaseController
  before_action :find_restaurant, only: [ :show ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end 
end 