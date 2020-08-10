time_now  = Time.now

user_names = ["Nao", "Megu", "Kaede"]
question_titles =  File.read(Rails.root.join('db', 'random_questions.txt')).split("\n")

user_names.each do |name|
  created_at = Time.now - (3*365).days
  User.create!(
    name: name,
    password: "password",
    password_confirmation: "password",
    created_at: created_at,
    updated_at: created_at
  )
end

question_titles.each do |title|
  user_id = 1 + rand(user_names.length)
  user = User.find_by_id(user_id)
  created_at = rand(user.created_at..time_now)
  Question.create!(
    title: title,
    content: Faker::Lorem.sentence(word_count: 20),
    is_resolved: [true, false].sample,
    user_id: user_id,
    created_at: created_at,
    updated_at: created_at
  )
end
