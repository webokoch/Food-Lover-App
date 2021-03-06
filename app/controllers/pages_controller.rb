class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @foods = Food.order(avg_rating: :desc).limit(4)
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end

  end

  def search
    @results = PgSearch.multisearch(query_params[:query])
  end

  private

  def query_params
    params.require(:query).permit(:query) if params[:query].present?
  end
end
