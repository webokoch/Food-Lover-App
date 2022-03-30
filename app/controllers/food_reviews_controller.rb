class FoodReviewsController < ApplicationController
  before_action :find_food

  def new
    @food_review = FoodReview.new
  end

  def create

  end

  private
  def find_food
    @food = Food.find(params[:food_id])
  end

  def food_review_params
    params.require(:food_review).permit(:rating, :content)
  end
end
