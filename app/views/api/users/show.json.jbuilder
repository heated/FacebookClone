json.(@user, 
        :id, 
        :name, 
        :gender, 
        :email,
        :birthday, 
        :created_at,
        :updated_at)

json.friends @friends_bool

json.requested @requested_bool

json.wall_posts @wall_posts do |post|
  json.(post, :id, :created_at, :updated_at, :body)
  
  json.user post.user.to_builder

  json.comments post.comments do |comment|
    json.(comment, :id, :created_at, :updated_at, :body)
    json.user comment.user.to_builder
  end
end