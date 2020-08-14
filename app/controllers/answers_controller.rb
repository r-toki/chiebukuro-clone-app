class AnswersController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      flash[:success] = "Posted answer"
    else
      flash[:danger] = "Failed to answer this question."
    end
    redirect_to answer.question
  end

  def destroy
    unless @answer.question.is_resolved
      @answer.destroy
      flash[:success] = "Answer deleted"
    end
    redirect_to request.referrer || root_url
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :usuer_id, :question_id)
    end

    def correct_user
      @answer = current_user.answers.find_by(id: params[:id])
      redirect_to root_url if @answer.nil?
    end

end
