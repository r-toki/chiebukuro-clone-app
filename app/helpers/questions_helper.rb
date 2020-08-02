module QuestionsHelper
  def index_page_title
    if params[:is_resolved] == '0'
      return 'Unresolved Questions'
    elsif params[:is_resolved] == '1'
      return 'Resolved Questions'
    else
      return 'All Questions'
    end
  end
end
