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
  @status = "offline"
  erb :index
end

# -------------------------------------
# Rooms
# -------------------------------------

get '/sessions/new' do
  @session = Session.new
  @session.save
  @status = "online"
  erb :'/sessions/new'
end
<<<<<<< HEAD

get '/reviews/index' do
  erb :'/reviews/index'
end
=======
 
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
