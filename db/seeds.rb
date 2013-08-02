require 'faker'

10.times do
  task = Task.new
  task.name = Faker::Lorem.sentence(3+rand(7)).chop
  task.completed = [true, false].sample
  task.save
end
