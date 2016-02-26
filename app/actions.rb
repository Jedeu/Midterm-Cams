# Homepage (Root path)
get '/' do
  erb :index
end

get '/sessions/new' do
  
  @session=Session.new
  @session.save
  erb :'/sessions/new'
end

get '/reviews/index' do
  erb :'/reviews/index'
end