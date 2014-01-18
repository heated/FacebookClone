class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_user(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render json: User.find(params[:id])
  end
end
