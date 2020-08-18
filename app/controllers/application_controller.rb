class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user != nil
  end

  def logged_in_user
    if current_user.nil?
      flash[:danger] = "Please Log in"
      redirect_back = request.original_fullpath if request.get?
      redirect_to new_session_path(redirect_back: redirect_back)
    end
  end

  def redirect_back_or(default)
    redirect_back = params[:redirect_back]
    redirect_to redirect_back if redirect_back && !redirect_back.empty? && path_exists?(redirect_back)
    redirect_to default
  end

  private

    def path_exists?(test_path)
      Rails.application.routes.recognize_path(test_path)
      true
    rescue ActionController::RoutingError
      false
    end

end
