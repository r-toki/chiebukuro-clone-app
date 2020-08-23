module Users

  class QuestionsController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @questions = get_questions_with_type_query.paginate(page: params[:page], per_page: 10)
    end

    private

      def get_questions_with_type_query
        if params[:type] == "posted"
          @user.questions
        else
          Question.joins(
            "INNER JOIN answers ON answers.question_id = questions.id
            WHERE answers.user_id = #{params[:user_id]}"
          ).distinct
        end
      end

  end

end
