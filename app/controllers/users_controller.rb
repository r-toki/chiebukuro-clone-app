class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
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

  def update
    if @user.save
      redirect_to @user, flash: { success: 'User was successfully updated.'}
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to @user, flash: { success: 'User was successfully destroyed.'}
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
