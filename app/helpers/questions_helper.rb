module QuestionsHelper

  def index_page_title
    if params[:is_resolved] == 'true'
      'Resolved Questions'
    elsif params[:is_resolved] == 'false'
      'Unresolved Questions'
    else
      'All Questions'
    end
  end

end
