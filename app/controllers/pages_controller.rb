class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @foods = Food.order(avg_rating: :desc).limit(4)
  end

  def search
    @results = PgSearch.multisearch(query_params[:query])
  end

  private

  def query_params
    params.require(:query).permit(:query) if params[:query].present?
  end
end
