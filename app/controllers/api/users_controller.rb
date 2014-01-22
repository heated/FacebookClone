class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends_bool = !!Friendship.exists?(current_user.id, @user.id)
    @requested_bool = !!FriendRequest.find_by_ids(current_user.id, @user.id)
    @wall_posts = @user.wall_posts.order("posts.created_at DESC").limit(10)
  end

  def update
    attrs = params[:user]

    if current_user.update_attributes(attrs)
      render json: :ok
    else
      render json: current_user.errors.full_messages, status: 422
    end
  end
end
