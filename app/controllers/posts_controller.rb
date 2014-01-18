class PostsController < ApplicationController
  before_filter :must_be_logged_in
  before_filter :owner_of_post, :only => [:update, :show, :destroy]

  def index
    @posts = current_user.friend_posts.order("created_at DESC")
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_url
    else
      flash.now[:errors] = @post.errors.full_messages
      index
      render :index
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end
end
