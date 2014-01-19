class CommentsController < ApplicationController
  before_filter :must_be_logged_in
  before_filter :owner_of_comment, :only => [:edit, :update, :show, :destroy]

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: @comment.to_builder.target!
    else
      render json: { errors: @comment.errors.full_messages}, status: 422
    end
  end

  def update
    if @comment.update_attributes(params[:comment])
      render json: @comment.to_builder.target!
    else
      render json: { errors: @comment.errors.full_messages}, status: 422
    end
  end

  def destroy
    render json: @comment.to_builder.target!
    @comment.destroy
  end
end
