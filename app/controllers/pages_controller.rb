class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :data, only: [:landing, :home, :map]

  def landing
  end

  def home
  end

  def map
  end

  def food_info
  end

  def restaurant_info
  end

  def map_info
  end

  def api 
  end

  def about
  end
  
  def search
    @raw_results = PgSearch.multisearch(query_params[:query])
    @results = get_uniq_results(@raw_results)
    @food_results = food_results(@results)
    @restaurant_results = restaurant_results(@results)
  end

  private

  def query_params
    params.require(:query).permit(:query) 
  end


  def data
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

  def get_uniq_results(results)
    uniq_results = []
    results.each do |result|
      uniq_results.push(result.searchable)
      if result.searchable_type == "Food" && result.searchable.restaurants 
        result.searchable.restaurants.each do |restaurant|
          uniq_results.push(restaurant)
        end
      end
    end
    uniq_results = uniq_results.uniq.sort_by {|r| r.class.name}
  end

  def food_results(results)
    food_results = []
    results.each do |r|
      r.instance_of?(Food) && food_results.push(r)
    end
    food_results
  end

  def restaurant_results(results)
    restaurant_results = []
    results.each do |r|
      r.instance_of?(Restaurant) && restaurant_results.push(r)
    end
    restaurant_results
  end
end