class Api::FriendsController < ApplicationController
  before_filter :must_be_logged_in

  def index
    @friends = current_user.friends
  end

  def create
    user2 = User.find(params[:user_id])
    if user2
      id1 = current_user.id
      id2 = user2.id
      request = FriendRequest.find_by_ids(id2, id1)
      if request
        request.destroy
        Friendship.create! user_from_id: id1,
                             user_to_id: id2
        Friendship.create! user_from_id: id2,
                             user_to_id: id1
        render json: :ok
      else
        render json: "They haven't friended you! D:", status: 422
      end
    else
      render json: "We couldn't find that person. ;-;", status: 422
    end
  end

  def destroy
    id1 = current_user.id
    id2 = params[:user_to_id]
    friendships = FriendRequest.find_by_ids(id1, id2) +
                     Friendship.find_by_ids(id1, id2)

    friendships.each { |friendship| friendship.destroy if friendship }
    render json: :ok
  end
end
