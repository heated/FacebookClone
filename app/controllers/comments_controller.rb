class CommentsController < ApplicationController
  before_filter :must_be_logged_in
  before_filter :owner_of_comment, :only => [:edit, :update, :show, :destroy]
  
  def index
    render json: Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to posts_url
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def update
    if @comment.update_attributes(params[:comment])
      goto_parent_post_url
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_url
  end

  def goto_parent_post_url
    redirect_to post_url(params[:post_id])
  end
end
