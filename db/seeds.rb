require 'faker'

10.times do 
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: Faker::Internet.password) 
end

loop do 
  Category.create(name: Faker::ProgrammingLanguage.name)
  break if Category.count == 15
end
20.times do 
  Question.create!(title: Faker::Lorem.sentence(word_count: 3), 
                   text: Faker::Lorem.sentence(word_count: 45),
                   user: User.all.sample,
                   category: Category.all.sample) 
end

35.times do 
  Answer.create!(text: Faker::Lorem.sentence(word_count: 35),
                 user: User.all.sample,
                 question: Question.all.sample) 
end