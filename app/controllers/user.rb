
get '/users/login' do
  @error = "Invalid Email Or Password" if params['e']
  @logout = "You Have Been Logged Out" if params['lo']
  @unauthorized = "You Must Be Logged In To View Your Profile" if params['ua']
  erb :'users/login'
end

get '/users/register' do
  erb :'users/register'
end

post '/users/register' do
  @new_user = User.new(params)
  @new_user.save
  erb :'users/register'
end


get '/users/profile' do
  redirect 'users/login?ua=1' if !session[:username]

  @user = User.find_by(id: session[:username])
  erb :'users/profile'
end

post '/users/profile' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:username] = @user.id
    redirect '/users/profile'
  else
    redirect '/users/login?e=1'
  end
    erb :'users/profile'
end

get '/users/logout' do
  session.delete(:username)
  redirect to '/users/login?lo=1'
end
