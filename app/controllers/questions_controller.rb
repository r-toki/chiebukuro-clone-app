class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    if session[:question_content]
      @question.content = session[:question_content]
      session.delete(:question_content)
    end
  end

  # POST /questions
  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content, :is_resolved)
    end
end
