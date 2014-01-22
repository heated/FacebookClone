class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @friends_bool = !!Friendship.exists?(current_user.id, @user.id)
    @requested_bool = !!FriendRequest.find_by_ids(current_user.id, @user.id)
    @wall_posts = @user.wall_posts.order("posts.created_at DESC").limit(10)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
