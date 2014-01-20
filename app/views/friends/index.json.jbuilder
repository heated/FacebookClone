json.array! @friends do |friend|
  json.(friend, :id, :name)
end