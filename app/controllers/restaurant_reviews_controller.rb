class RestaurantReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @restaurant_review = RestaurantReview.new
    authorize @restaurant_review
  end

  def create
    @restaurant_review = RestaurantReview.new(restaurant_review_params)
    @restaurant_review.restaurant = @restaurant
    @restaurant_review.user = current_user
    authorize @restaurant_review
    if @restaurant_review.save
      redirect_to restaurant_path(@restaurant, anchor: "restaurant-review-#{@restaurant_review.id}")
    else
      render 'new'
    end
  end

  private
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def restaurant_review_params
    params.require(:restaurant_review).permit(:rating, :content)
  end
end
