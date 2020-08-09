class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'invalid name/password combination'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
