class QuestionsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def index
    @questions = get_questions_with_resolved_query.paginate(page: params[:page], per_page: 10)
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
    question = Question.find(params[:id])
    if question.answers.count == 0 && question.user_id == current_user.id
      question.destroy
      flash[:success] = "Qeustion deleted"
    end
      redirect_to current_user || root_url
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

    def get_questions_with_resolved_query
      resolved_question_ids = Question.joins(:answers).where("answers.best = true").pluck(:id)
      if params[:resolved] ==  "true"
        Question.where(id: resolved_question_ids)
      else
        all_question_ids = Question.all.pluck(:id)
        Question.where(id: all_question_ids - resolved_question_ids)
      end
    end

end
