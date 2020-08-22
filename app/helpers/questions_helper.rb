module QuestionsHelper

  def index_page_title
    if params[:resolved] == "true"
      "Resolved Questions"
    else
      "Unresolved Questions"
    end
  end

end
