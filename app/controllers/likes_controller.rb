class LikesController < ApplicationController
  before_action :find_food

  def create
    @food.likes.create(user_id: current_user.id)
    redirect_to food_path(@food)
  end

  private

  def find_post
    @food = Food.find(params[:food_id])
  end
end
