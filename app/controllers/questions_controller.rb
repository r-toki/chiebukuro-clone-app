class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new]

  def index
    if params[:is_resolved] == '0'
      @questions = Question.where(is_resolved: false)
    elsif params[:is_resolved] == '1'
      @questions = Question.where(is_resolved: true)
    else
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question posted!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def question_params
      params.require(:question).permit(:title, :title, :content)
    end

end
