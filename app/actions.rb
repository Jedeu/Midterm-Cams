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
    @users = User.all.where("id != ?", current_user.id)
    erb :index
  else
    redirect '/login'
  end
end

# -------------------------------------
# Users / Edit
# -------------------------------------

get '/user/settings' do
  erb :'user/edit'
end

post '/user/settings' do
  @interest = Interest.create(user: current_user, category: Category.find_by(tag: params[:categories].capitalize))
  redirect '/user/settings'
end
  
# -------------------------------------
# Users / Profile
# -------------------------------------

get '/user/profile' do
  erb :'user/profile'
end 

# -------------------------------------
# Rooms
# -------------------------------------

get '/rooms/create' do
  @room = Room.new
  @room.host = current_user
  @room.save
  redirect "/rooms/#{@room.id}/show"
end

post '/host_room' do
  content_type :json
  current_user.update(has_taught: true)
  @room = Room.find(params[:id])
  # if current_user.id = @room.teacher_id
  #   current_user.update(time_taught: time_taught += params[:js_timer])
  # end
  {host: true}.to_json
end

get '/host_room' do
  content_type :json
  current_user.update(has_taught: false)
  redirect '/'
end

get '/rooms/:id/show' do
  @room = Room.find(params[:id])
  @in_room = true
  @status = "online"
  erb :'/rooms/create'
end


get '/rooms/:id/join' do
    @room = Room.find(params[:id])
    @room.update(user_id: current_user.id)
    # set the current_user to @room.user
    redirect "/rooms/#{@room.id}/show"
end

# -------------------------------------
# Login
# -------------------------------------

get '/login' do
  if current_user
    current_user.update(is_online: false)
    redirect '/'
  else
    erb :'sessions/login'
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
  current_user.update(has_taught: false)
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
    erb :'sessions/signup'
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
    erb :'sessions/signup'
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


