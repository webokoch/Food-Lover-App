class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_food, only: [:show, :edit, :update, :destroy]

  def index
      @foods = Food.all
  end

  def show
    @food_review = FoodReview.new
  end

  def users_foods
    @foods = Food.where(user_id: current_user)
  end

  def new
    @food = Food.new
    authorize @food
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    authorize @food
    if @food.save
      redirect_to food_path(@food)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to users_foods_path
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to users_foods_path
  end

  private

  def find_food
    @food = Food.find(params[:id])
    authorize @food
  end

  def food_params
    params.require(:food).permit(:name, :cuisine, :description, :photo)
  end
end