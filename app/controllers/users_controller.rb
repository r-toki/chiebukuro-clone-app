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
    # @user = User.find(params[:id])
    redirect_to users_questions_path(user_id: params[:id], questions_type: "posted")
  end

  def questions
    @user = User.find(params[:user_id])
    @questions = get_questions_with_query
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def get_questions_with_query
      if params[:questions_type] == "posted"
        @user.questions
      elsif params[:questions_type] == "answered"
        # user が回答した質問　かつ　user が投稿した質問ではない
        Question.joins(
          "INNER JOIN answers ON answers.question_id = questions.id
          WHERE answers.user_id = #{params[:user_id]} and questions.user_id != #{params[:user_id]}"
        ).uniq
      end
    end

end
