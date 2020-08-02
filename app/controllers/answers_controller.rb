class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    !@answer.save && flash[:danger] = @answer.errors.full_messages.to_sentence
    redirect_to question_path(params[:answer][:question_id])
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :user_id, :question_id)
    end

end
