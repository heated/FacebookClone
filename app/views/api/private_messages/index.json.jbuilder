json.array! @messages do |message|
  json.(message, :id, :created_at, :updated_at, :body)
  
  json.user_from message.user_from.to_builder

  json.user_to message.user_to.to_builder
end