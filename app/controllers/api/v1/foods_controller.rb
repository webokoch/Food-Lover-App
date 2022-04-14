class Api::V1::FoodsController < Api::V1::BaseController
  before_action :find_food, only: [ :show ]

  def index
    @foods = policy_scope(Food)
  end

  def show
  end

  private

  def set_food
    @food = Food.find(params[:id])
    authorize @food
  end
end