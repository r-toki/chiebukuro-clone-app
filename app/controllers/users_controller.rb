class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_back_or @user
    else
      render :new
    end
  end

  def show
    redirect_to user_questions_path(user_id: params[:id], type: "posted")
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
