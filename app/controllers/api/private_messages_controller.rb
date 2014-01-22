class Api::PrivateMessagesController < ApplicationController
  before_filter :must_be_logged_in

  def index
    @messages = current_user.messages.order("created_at DESC").limit(10)
  end

  def create
    @message = PrivateMessage.new
    user_to = User.find_by_name(params[:name])

    unless user_to
      render json: "can't find that person", status: 422
    else

      unless Friendship.find_by_user_from_id_and_user_to_id(current_user.id, user_to.id)
        render json: "You are not friends with them.", status: 422
      else

        @message.user_to = user_to
        @message.user_from = current_user
        @message.body = params[:body]

        if @message.save
          render json: @message.to_builder.target!
        else
          render json: @message.errors.full_messages, status: 422
        end
      end
    end
  end
end
