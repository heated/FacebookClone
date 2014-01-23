json.array! @suggestions do |user|
  json.(user, :id, :name)
  json.icon user.profile_pic.url(:small)
  json.familiarity user.attributes["familiarity"]
end