module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    current_user
  end

  def log_in_user(user)
    user.save!
    session[:session_token] = user.session_token
  end
end
