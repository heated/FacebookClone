json.array! @requests do |user|
  json.(user, :id, :name)
end