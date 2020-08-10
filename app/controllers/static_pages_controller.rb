class StaticPagesController < ApplicationController

  def home
  end

  def create_question
    session[:question_content] = params[:question][:content]
    redirect_to new_question_url
  end

end
