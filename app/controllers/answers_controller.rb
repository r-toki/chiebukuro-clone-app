class AnswersController < ApplicationController

  def create
    answer = current_user.answers.build(answer_params)
    unless answer.save
      flash[:danger] = "Failed to answer this question."
    end
    redirect_to answer.question
  end

  def update
  end

  def destroy
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :usuer_id, :question_id)
    end

end
