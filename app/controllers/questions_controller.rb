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
    @answers = @question.answers
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
