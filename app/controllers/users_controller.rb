class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_user(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.fullmessages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
