
# Login controller =========================================================

#admin login page
get '/log_in' do
  erb :log_in
end

# process to login 
post '/log_in' do

  #check account exist in db
  user = find_user_by_email(params[:email])
  #binding.pry
  #check if password is valid
  if BCrypt::Password.new(user["password_digest"]) == params[:password]
    #create a session
    session[:id] = user["id"]
    #return "yes!"
    redirect '/'
  else
    return "try again please"
  end

end

get '/log_out' do
  session[:email] = nil
  redirect '/log_in'
end

# Login controller end =======================================================


