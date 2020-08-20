class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.set_resolved
    @is_correct_user = current_user == @question.user

    @best_answer = @question.answers.find_by(best: true)
    @answers = @question.answers.where(best: nil).includes(:user)
  end

  def update
  end

  def destroy
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

end
