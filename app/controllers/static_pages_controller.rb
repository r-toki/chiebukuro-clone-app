class StaticPagesController < ApplicationController

  def home
    @resolved_questions = Question.where(is_resolved: true).limit(5)
    @unresolved_questions = Question.where(is_resolved: false).limit(5)
  end

end
