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
    @show_balance = true
    @users = User.all.where("id != ?", current_user.id)
    # This orders the users and makes the users who are online
    # appear at the top of the list.
    @ordered_users = []
    @users.each do |user|
      if user.is_online == true
        @ordered_users.unshift(user)
      else
        @ordered_users << user
      end
    end
    @ordered_users
    erb :index
  else
    redirect '/login'
  end
end

# Temporaliy put here for posting the "Load Account" button/form
# located on the bottom of the layouts.erb
post '/' do
  redirect '/'
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

# Room final review
get '/rooms/review' do
  # @room = Room.find(params[:id])
  if current_user.id == Room.last.teacher_id
    redirect '/'
  else
  @user = User.find_by(name: "corey")
  @teacher = User.find(Room.last.teacher_id)
  @time = Room.last.classtime
  @hourly_rate = User.last.hourly_rate
  @total = ((@time * @hourly_rate)/ 3600).round(2)
  @remainder = @user.balance - @total
  @show_balance = true
    erb :'/rooms/review'
  end
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

post '/save_timer' do
  content_type :json
  seconds = params[:sec].to_i
  @room = Room.last
  if current_user.id == @room.teacher_id
    current_user.update(time_taught: current_user.time_taught+seconds)
    @room.update(classtime: seconds )
  end
  erb :'/rooms/review'
end

# Room final review
get '/rooms/review' do
  # @room = Room.find(params[:id])
  @show_balance = true
  erb :'/rooms/review'
end

