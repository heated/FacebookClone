class PrivateMessagesController < ApplicationController
  before_filter :must_be_logged_in
  def index
    @message = PrivateMessage.new
    @messages = current_user.messages
  end

  def create
    @message = PrivateMessage.new
    attrs = params[:private_message]
    name = attrs[:user_to]
    user_to = User.find_by_name(name)

    unless user_to
      flash[:errors] = ["Can't find that person! :("]
      return go_to_messages
    end

    unless Friendship.find_by_user_from_id_and_user_to_id(current_user.id, user_to.id)
      flash[:errors] = ["You don't even know him! :o"]
      return go_to_messages
    end

    @message.user_to = user_to
    @message.user_from = current_user
    @message.body = attrs[:body]

    if @message.save
      go_to_messages
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end

  def go_to_messages
    redirect_to private_messages_url
  end
end
