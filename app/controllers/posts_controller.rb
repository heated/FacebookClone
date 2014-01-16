class PostsController < ApplicationController
  before_filter :must_be_logged_in
  before_filter :owner_of_post, :only => [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.fullmessages
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    else
      flash.now[:errors] = @post.errors.fullmessages
      render :show
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end
end
