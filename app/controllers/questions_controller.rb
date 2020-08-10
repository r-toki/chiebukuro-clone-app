class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :update]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = get_questions_with_query
  end

  def show
  end

  def new
    @question = Question.new
    if session[:question_content]
      @question.content = session[:question_content]
      session.delete(:question_content)
    end
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question.update!(question_params)
    redirect_to @question
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :is_resolved)
    end

    def get_questions_with_query
      if params[:is_resolved] ==  "true"
        Question.where(is_resolved: true)
      elsif params[:is_resolved] == "false"
        Question.where(is_resolved: false)
      else
        Question.all()
      end
    end

end
