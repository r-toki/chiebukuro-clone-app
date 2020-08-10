users = ["Nao", "Megu", "Kaede"]
questions =  File.read(Rails.root.join('db', 'random_questions.txt')).split("\n")

users.each do |user|
  User.create!(
    name: user,
    password: "password",
    password_confirmation: "password"
  )
end

questions.each do |question|
  Question.create!(
    title: question,
    content: Faker::Lorem.sentence(word_count: 20),
    is_resolved: [true, false].sample,
    user_id: 1 + rand(users.length)
  )
end
