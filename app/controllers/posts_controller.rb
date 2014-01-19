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
      render json: @post.to_builder.target!
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post.to_builder.target!
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def destroy
    @post.destroy
    render json: @post.to_builder.target!
  end
end
