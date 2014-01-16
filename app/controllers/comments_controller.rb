class CommentsController < ApplicationController
  before_filter :must_be_logged_in
  before_filter :owner_of_comment, :only => [:edit, :update, :show, :destroy]
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      goto_parent_post_url
    else
      flash.now[:errors] = @comment.errors.fullmessages
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
      goto_parent_post_url
    else
      flash.now[:errors] = @comment.errors.fullmessages
      render :edit
    end
  end

  def destroy
    @comment.destroy
    goto_parent_post_url
  end

  def goto_parent_post_url
    redirect_to post_url(params[:post_id])
  end
end
