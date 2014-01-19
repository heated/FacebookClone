class FriendsController < ApplicationController
  before_filter :must_be_logged_in
  def index
    render json: current_user.friends
  end

  def create
    id1 = current_user.id
    user2 = User.find_by_name(params[:user][:name])
    if user2
      id2 = user2.id
      if Friendship.find_by_ids(id1, id2) || id1 == id2
        flash[:errors] = ["Invalid friend request."]
        return redirect_to friends_url
      end
      requests = FriendRequest.find_by_ids(id1, id2)
      create_hash = { user_from_id: id1, user_to_id: id2 }
      reverse_hash = { user_from_id: id2, user_to_id: id1 }
      if requests
        requests.each { |request| request.destroy if request }
        Friendship.create!(create_hash)
        Friendship.create!(reverse_hash)
        render json: "hi"
      else
        p FriendRequest.create!(create_hash)
        render json: "hi"
      end
    else
      render json: "Can't find that person.", status: 422
    end
  end

  def destroy
    id1 = current_user.id
    id2 = params[:user_to_id]
    friendships = FriendRequest.find_by_ids(id1, id2) +
                     Friendship.find_by_ids(id1, id2)

    friendships.each { |friendship| friendship.destroy if friendship }
    redirect_to friends_url
  end
end
