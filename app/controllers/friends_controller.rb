class FriendsController < ApplicationController
  before_filter :must_be_logged_in

  def index
    @friends = current_user.friends
  end

  def create
    id1 = current_user.id
    user2 = User.find_by_name(params[:name])
    if user2
      id2 = user2.id
      if Friendship.exists?(id1, id2) ||
         id1 == id2 ||
         FriendRequest.find_by_ids(id1, id2)
        render json: "Unacceptable Request", status: 422
      else
        request = FriendRequest.find_by_ids(id2, id1)
        create_hash = { user_from_id: id1, user_to_id: id2 }
        reverse_hash = { user_from_id: id2, user_to_id: id1 }
        if request
          request.destroy
          Friendship.create!(create_hash)
          Friendship.create!(reverse_hash)
          render json: { user: user2 }
        else
          FriendRequest.create!(create_hash)
          render json: "Requested"
        end
      end
    else
      render json: "Can't find that person", status: 422
    end
  end

  def destroy
    id1 = current_user.id
    id2 = params[:user_to_id]
    friendships = FriendRequest.find_by_ids(id1, id2) +
                     Friendship.find_by_ids(id1, id2)

    friendships.each { |friendship| friendship.destroy if friendship }
    render json: User.find(id2)
  end
end
