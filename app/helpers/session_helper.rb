module SessionHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      session[:redirect_back] = request.original_url if request.get?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:redirect_back] || default)
    session.delete(:redirect_back)
  end

end
