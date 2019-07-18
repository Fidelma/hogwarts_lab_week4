require('sinatra')
require('sinatra/reloader')
require_relative('./models/student.rb')
require_relative('./models/house.rb')
also_reload('./models/*')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

get '/houses' do
  @houses = House.all()
  erb(:'houses/index')
end
