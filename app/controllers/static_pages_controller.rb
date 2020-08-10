class StaticPagesController < ApplicationController

  def home
    @resolved_questions = Question.where(is_resolved: true).limit(5)
    @unresolved_questions = Question.where(is_resolved: false).limit(5)
  end

  def create_question
    session[:question_content] = params[:question][:content]
    redirect_to new_question_url
  end

end
