class PrivateMessagesController < ApplicationController
  before_filter :must_be_logged_in
  def index
    @messages = current_user.messages
  end

  def new
    @message = PrivateMessage.new
  end

  def create
    @message = PrivateMessage.new
    attrs = params[:private_message]

    name = attrs[:user_to]
    @message.user_to = User.find_by_name(name)
    @message.user_from = current_user
    @message.body = attrs[:body]
    if @message.save
      redirect_to private_messages_url
    else
      flash.now[:errors] = @message.errors.fullmessages
      render :new
    end
  end
end
