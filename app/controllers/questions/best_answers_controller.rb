module Questions
  class BestAnswersController < ApplicationController
    def update
      question = Question.find(params[:question_id])
      if current_user == question.user
        answer = Answer.find(params[:id])
        answer.update(best: true)
      end
      redirect_to question
    end
  end
end
