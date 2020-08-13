module QuestionsHelper

  def index_page_title is_resolved
    if is_resolved == 'true'
      'Resolved Questions'
    elsif is_resolved == 'false'
      'Unresolved Questions'
    else
      'All Questions'
    end
  end

end
