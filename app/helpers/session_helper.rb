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
    if current_user.nil?
      redirect_back = request.original_url if request.get?
      redirect_to login_path(redirect_back: redirect_back)
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    if params[:redirect_back].empty?
      redirect_to default
    else
      redirect_to params[:redirect_back]
    end
  end

end
