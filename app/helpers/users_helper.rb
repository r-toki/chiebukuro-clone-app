module UsersHelper

  def current_questions_type?(questions_type)
    return 'active' if params[:questions_type] == questions_type
    ''
  end

end
