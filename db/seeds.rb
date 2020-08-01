User.create!(
  name: "Ryosuke",
  password: "password",
  password_confirmation: "password",
)

user = User.first
5.times do
  title = "Is #{Faker::Sports::Football.player} better than #{Faker::Sports::Football.player}?"
  content = Faker::Lorem.sentence(word_count: 20)
  user.questions.create!(title: title, content: content)
end
