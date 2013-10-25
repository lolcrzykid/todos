require 'faker'
require_relative '../config/application'

100.times do
  Task.create(todo_text: Faker::Lorem.words.join(" "))
end  

