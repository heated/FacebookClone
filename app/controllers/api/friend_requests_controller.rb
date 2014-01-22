class Api::FriendRequestsController < ApplicationController
  before_filter :must_be_logged_in

  def index
    @requests = current_user.confirmable_friend_requests
  end

  def create
    user2 = User.find(params[:user_id])
    if user2
      id1 = current_user.id
      id2 = user2.id
      unless FriendRequest.invalid_request(id1, id2)
        FriendRequest.create! user_from_id: id1,
                                user_to_id: id2
        render json: :ok
      else
        render json: "Invalid Request", status: 422
      end
    else
      render json: "Can't find that person", status: 422
    end
  end

  def destroy
    request = FriendRequest.find_by_ids(current_user.id, 
                                           params[:user_to_id])
    request.destroy if request

    render json: :ok
  end
end
