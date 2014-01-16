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

  def must_be_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def owner_of_post
    @post = Post.find(params[:id])
    redirect_to posts_url unless @post.user_id == current_user.id
  end
end
