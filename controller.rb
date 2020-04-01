require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/house.rb')
require_relative('./models/student.rb')
also_reload('./models/*')

get '/home' do
  erb(:home)
end

get '/home/students' do
  @students = Student.all()
  erb(:students)
end

get '/home/students/create' do
  @houses = House.all()
  erb(:create)
end

post '/home' do
  new_student = Student.new(params)
  new_student.save()
  erb(:success)
end
