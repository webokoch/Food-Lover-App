json.array! @foods do |food|
  json.extract! food, :id, :name, :cuisine, :description, :user, :food_reviews, :likes
end