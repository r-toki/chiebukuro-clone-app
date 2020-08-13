class ApplicationController < ActionController::Base

  # declare
  helper_method :current_user, :logged_in?

  # session 関連
  def curren_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    current_user != nil
  end

  def logged_in_user
    if current_user.nil?
      flash[:danger] = "Please Log in"
      redirect_back = request.original_fullpath if request.get?
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
    elsif path_exists?(params[:redirect_back])
      redirect_to params[:redirect_back]
    else
      redirect_to root_path
    end
  end

  def path_exists?(path)
    Rails.application.routes.recognize_path(path)
    true
  rescue ActionController::RoutingError
    false
  end

end
