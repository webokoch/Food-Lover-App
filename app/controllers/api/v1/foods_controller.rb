class Api::V1::RestaurantsController < Api::V1::BaseController
  def index
    @foods = policy_scope(Food)
  end
end