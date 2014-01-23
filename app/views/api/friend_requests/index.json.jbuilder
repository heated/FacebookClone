json.array! @requests do |user|
  json.(user, :id, :name)
  json.icon user.profile_pic.url(:small)
end