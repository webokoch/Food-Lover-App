class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_food, only: [:show, :edit, :update, :destroy]
  
  def index
    @foods = Food.all
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
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
      redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path
  end

  private

  def find_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :cuisine, :description)
  end
end
