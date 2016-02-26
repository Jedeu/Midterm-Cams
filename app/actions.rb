# Homepage (Root path)
get '/' do
  erb :index
end

get '/sessions/new' do
  
  @session=Session.new
  @session.save
  erb :'/sessions/new'
end
 

get '/login' do
  erb :'/user_sessions/login'
end

get '/register' do

end
