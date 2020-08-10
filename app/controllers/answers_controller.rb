class AnswersController < ApplicationController

  before_action :logged_in_user, only: [:create]

  def create
    answer = current_user.answers.build(answer_params)
    !answer.save && flash[:danger] =  "Failed to answer this quesion."
    redirect_to answer.question
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end

end
