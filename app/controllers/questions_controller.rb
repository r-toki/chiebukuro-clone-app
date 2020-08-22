class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def index
    @questions = get_questions_with_resolved_query.paginate(page: params[:page], per_page: 10)
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

    @best_answer = @question.answers.find_by(best: true)
    @other_answers = @question.answers.where(best: nil).includes(:user)
  end

  def destroy
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

    def get_questions_with_resolved_query
      if params[:resolved] ==  "true"
        Question.joins(:answers).where("answers.best == true")
      else
        Question.joins('LEFT OUTER JOIN "answers" ON "answers"."question_id" = "questions"."id" AND ("answers""id" = NULL OR "answers""best" =  NULL)')
      end
    end

end
