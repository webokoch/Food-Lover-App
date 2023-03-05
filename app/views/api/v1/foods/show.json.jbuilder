json.extract! @food, :id, :name, :cuisine, :description, :user
json.reviews @food.food_reviews do |review|
  json.extract! review, :id, :rating, :content, :user
end
json.restaurants @food.restaurants.uniq do |restaurant|
  json.extract! restaurant, :id, :name, :cuisine, :location, :user
end
json.likes @food.likes do |like|
  json.extract! like, :id, :user
end