class FoodReviewsController < ApplicationController
  before_action :find_food

  def new
    @food_review = FoodReview.new
  end
  
  def create
    @food_review = FoodReview.new(food_review_params)
    @food_review.food = @food
    if @food_review.save
      redirect_to food_path(@food, anchor: "food-review-#{@food_review.id}")
    else
      render 'new'
    end
  end

  private
  def find_food
    @food = Food.find(params[:food_id])
  end

  def food_review_params
    params.require(:food_review).permit(:rating, :content)
  end
end
