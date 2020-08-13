class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.assign_attributes(question_params)
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

    def question_params
      params.require(:question).permit(:title, :content, :best_answer_id)
    end

end
