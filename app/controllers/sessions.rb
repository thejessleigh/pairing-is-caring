use OmniAuth::Builder do
  provider :dbc, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']
end

get '/sign_in' do
  redirect to ('/auth/dbc')
end

get '/auth/:provider/callback' do
  @user = User.create_or_find_user_from_oauth(request.env['omniauth.auth'].info)
  session[:user_id] = @user.id
  token = request.env['omniauth.auth'].credentials
  session[:oauth_token] = token_as_hash(token)
  redirect '/schedule'
end

get '/sign_out' do
  session.clear
  redirect '/'
end
