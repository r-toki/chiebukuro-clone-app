module QuestionsHelper

  def questions_index_page_title
    if params[:resolved] == "true"
      "Resolved Questions"
    else
      "Unresolved Questions"
    end
  end

end
