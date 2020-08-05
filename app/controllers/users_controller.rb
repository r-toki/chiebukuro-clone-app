class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posted_questions = @user.questions
    @answered_questions = Question.joins("INNER JOIN answers ON answers.question_id = questions.id WHERE answers.user_id = #{params[:id]}").uniq
  end

  def new
    @user  = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
