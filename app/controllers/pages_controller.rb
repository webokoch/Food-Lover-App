class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def search
    @foods = Food.search_foods(query_params[:query])
  end

  private

  def query_params
    params.require(:query).permit(:query) if params[:query].present?
  end
end
