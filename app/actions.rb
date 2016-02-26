# Homepage (Root path)
get '/' do
  erb :index
end

get '/rooms/new' do

  @room=Room.new
  @room.save
  erb :'/rooms/new'
end
 