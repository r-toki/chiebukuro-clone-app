class StaticPagesController < ApplicationController

  def home
    @resolved_questions = Question.where(is_resolved: true)
    @unresolved_questions = Question.where(is_resolved: false)
  end

  def create_question
    session[:question_content] = params[:question][:content]
    redirect_to new_question_url
  end

end
