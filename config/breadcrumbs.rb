crumb :root do
  link "Home", root_path
end

crumb :questions do
  if params[:resolved] == "true"
    name = "Resolved Questions"
  else
    name = "Unresolved Questions"
  end
  link name, questions_path(resolved: params[:resolved])
end

crumb :resolved_questions do
  link "Resolved Questions", questions_path(resolved: true)
end

crumb :unresolved_questions do
  link "Unresolved Questions", questions_path(resolved: false)
end

crumb :question do |question|
  link question.title, question
  if question.resolved
    parent :resolved_questions
  else
    parent :unresolved_questions
  end
end
