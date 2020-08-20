class AnswersController < ApplicationController

  before_action :logged_in_user, only: [:create, :update, :destroy]

  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      flash[:success] = "Answer created"
    else
      flash[:danger] = "Failed to create Answer"
    end
    redirect_to answer.question
  end

  def update
    answer = Answer.find(params[:id])
    if answer.update(answer_params)
      flash[:success] = "Answer updated"
    else
      flash[:danger] = "Failed to update Answer"
    end
    redirect_to answer.question
  end

  def destroy
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :best, :user_id, :question_id)
    end

end
