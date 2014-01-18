class PrivateMessagesController < ApplicationController
  before_filter :must_be_logged_in

  def index
    @messages = current_user.messages.order("created_at")
  end

  def create
    @message = PrivateMessage.new
    user_to = User.find_by_name(params[:name])

    unless user_to
      flash[:errors] = ["Can't find that person! :("]
      raise "error, son"
    end

    unless Friendship.find_by_user_from_id_and_user_to_id(current_user.id, user_to.id)
      flash[:errors] = ["You don't even know him! :o"]
      raise "error, son"
    end

    @message.user_to = user_to
    @message.user_from = current_user
    @message.body = params[:body]

    if @message.save
      render json: @message
    else
      flash.now[:errors] = @message.errors.full_messages
      raise "error, son"
    end
  end
end
