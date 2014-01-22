json.array! @posts do |post|
  json.(post, :id, :created_at, :updated_at, :body)
  
  json.user post.user.to_builder

  json.comments post.comments do |comment|
    json.(comment, :id, :created_at, :updated_at, :body)
    json.user comment.user.to_builder
  end
end