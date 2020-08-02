User.create!(
  name: "Ryosuke",
  password: "password",
  password_confirmation: "password",
)

user = User.first

title = "Resolved title"
content = "Resolved content"
is_resolved = true
user.questions.create!(title: title, content: content, is_resolved: is_resolved)

title = "Unresolved title"
content = "Unresolved content"
is_resolved = false
user.questions.create!(title: title, content: content, is_resolved: is_resolved)

10.times do
  title = "Is #{Faker::Sports::Football.player} better than #{Faker::Sports::Football.player}?"
  content = Faker::Lorem.sentence(word_count: 20)
  is_resolved = [true, false].sample
  question = user.questions.create(title: title, content: content, is_resolved: is_resolved)
  question.created_at = (rand*999).days.ago
  question.save
end
