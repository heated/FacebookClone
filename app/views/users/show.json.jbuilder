json.(@user, 
        :id, 
        :name, 
        :gender, 
        :email,
        :birthday, 
        :created_at,
        :updated_at)

json.friends !!Friendship.exists?(current_user.id, @user.id)

json.requested !!FriendRequest.find_by_ids(current_user.id, @user.id)
