json.array! @foods do |food|
  json.extract! food, :id, :name, :cuisine, :description, :food_reviews, :restaurants, :likes
end