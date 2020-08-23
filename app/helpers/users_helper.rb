module UsersHelper
  def current_questions_type?(type)
    return 'active' if params[:type] == type
    ''
  end
end
