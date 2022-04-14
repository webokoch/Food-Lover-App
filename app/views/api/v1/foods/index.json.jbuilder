json.array! @fodds do |food|
  json.extract! food, :id, :name, :cuisine, :description
end