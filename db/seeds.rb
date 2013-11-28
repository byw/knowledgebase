# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[User, Question, Answer].each(&:delete_all)

user = User.new
user.email = 'techteam@patientordersets.com'
user.name = 'Bobby'
user.password = '123'
user.save!


users = 16.times.map do |x|
  u = User.new
  u.name = Faker::Name.name
  u.email = Faker::Internet.email
  u.password = '123'
  u.save!
  u
end


20.times do |i|
  q = Question.new
  q.user = users.sample
  q.title = Faker::Lorem.sentence
  q.text = Faker::Lorem.paragraph

  q.tags_string = rand(2..5).times.map do
    Faker::Lorem.word
  end.join(' ')

  if i > 5
    rand(0..5).times do
      answer = q.answers.build
      answer.answer_user = users.sample
      answer.text = Faker::Lorem.paragraph
      answer.save!
    end
  end
  q.save!
end
