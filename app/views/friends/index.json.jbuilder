json.array! @friends do |user|
  json.(user, :id, :name)
end