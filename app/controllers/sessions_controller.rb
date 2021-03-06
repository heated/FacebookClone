class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])
    if @user
      log_in_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username/password!"]
      @user = User.new(params[:user])
      render :new
    end
  end

  def destroy
    log_in_user(current_user)
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
