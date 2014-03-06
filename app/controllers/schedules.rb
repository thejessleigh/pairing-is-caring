get '/schedule' do
  @user = User.find(session[:user_id])
  erb :schedule
end
