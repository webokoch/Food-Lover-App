json.extract! @restaurant, :id, :name, :cuisine, :description, :address, :user
json.reviews @restaurant.restaurant_reviews do |review|
  json.extract! review, :id, :rating, :content, :user
end
json.restaurants @restaurant.foods.uniq do |food|
  json.extract! food, :id, :name, :cuisine, :description, :user
end
