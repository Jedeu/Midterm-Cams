# -------------------------------------
# Helper Methods
# -------------------------------------

helpers do
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def flash_message
    @flash = session[:flash] if session[:flash]
    session[:flash] = nil
  end
end

# -------------------------------------
# Index
# -------------------------------------

# Homepage (Root path)
get '/' do
  if current_user
    @users = User.all
    erb :index
  else
    redirect '/login'
  end
end


# -------------------------------------
# Rooms
# -------------------------------------
get '/rooms/create' do
  @room=Room.new
  @room.teacher=current_user
  @room.save
  redirect to "/rooms/#{@room.id}/show"
end

get '/rooms/:id/show' do
  @room = Room.find(params[:id])
  @in_room=true
  @status = "online"
  erb :'/rooms/create'
end

get '/rooms/:id/join' do
    @room = Room.find(params[:id])
    # set the current_user to @room.user
    redirect to /rooms/#{@room.id}/show
end


# -------------------------------------
# Login
# -------------------------------------

get '/login' do
  if current_user
    redirect '/'
  else
    erb :'user_sessions/login'
  end
end

post '/login' do
  username = params[:name]
  password = params[:password]

  user = User.find_by(name: username, password: password)
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    session[:flash] = "Whoops, something isn't right."
    redirect '/login'
  end
end

# -------------------------------------
# Logout
# -------------------------------------

get '/logout' do
  current_user.update(is_online: false)
  session.clear
  redirect '/login'
end

# -------------------------------------
# Sign up
# -------------------------------------

get '/signup' do
  if current_user
    redirect '/'
  else
    erb :'user_sessions/signup'
  end
end

post '/signup' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'user_sessions/signup'
  end
end

post '/go_online' do
  content_type :json 
  if current_user.is_online
    current_user.update(is_online: false)
    return {online: true}.to_json
  else
    current_user.update(is_online: true)
    return {online: false}.to_json
  end

end
