class LikesController < ApplicationController
  before_action :find_food

  def create
    authorize @food.likes
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @food.likes.create(user_id: current_user.id)
    end
    redirect_to food_path(@food)
  end

  private

  def find_food
    @food = Food.find(params[:food_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, food_id:
    params[:food_id]).exists?
  end
end
