class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :destroy]

  def index
    @questions = get_questions_with_query.paginate(page: params[:page], per_page: 10)
  end

  def new
    @question = Question.new
    if params[:question]
      @question.assign_attributes(question_params)
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

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  private

    def question_params
      params.require(:question).permit(:title, :content, :is_resolved)
    end

    def get_questions_with_query
      if params[:is_resolved] == 'true'
        Question.where(is_resolved: true)
      elsif params[:is_resolved] == 'false'
        Question.where(is_resolved: false)
      else
        Question.all
      end
    end

end
