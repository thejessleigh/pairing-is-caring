get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/signup' do
  erb :register
end



#==========================================POST

post '/login' do
  @user = User.find_by_name(params[:name])

  if @user == nil
  	@errors = true
  	erb :login
  elsif @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = true
    erb :login
  end
end

post '/sigunup' do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = true
    erb :register
  end
end