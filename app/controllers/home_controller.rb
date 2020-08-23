class HomeController < ApplicationController
  def index
    resolved_question_ids = Question.joins(:answers).where("answers.best == true").pluck(:id)
    all_question_ids = Question.all.pluck(:id)
    @resolved_questions = Question.where(id: resolved_question_ids).limit(5)
    @unresolved_questions = Question.where(id: all_question_ids - resolved_question_ids).limit(5)
  end
end
