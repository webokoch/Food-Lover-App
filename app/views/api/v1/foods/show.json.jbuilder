json.extract! @food, :id, :name, :cuisine, :description
json.reviews @food.food_reviews do |review|
  json.extract! review, :id, :rating, :content, :user
end
json.restaurants @food.restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :cuisine, :location, :user
end