class AnswersController < ApplicationController

  before_action :logged_in_user, only: [:create, :update, :destroy]

  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      flash[:success] = "Answer created!"
    else
      flash[:danger] = "Invalid Answer"
    end
    redirect_to answer.question
  end

  def update
  end

  def destroy
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :user_id, :question_id)
    end

end
