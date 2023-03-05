json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :cuisine, :description, :address, :user, :restaurant_reviews
end