require 'sinatra'
require 'sinatra/reloader' # only reloads this file
require 'pg'
require'bcrypt'
require 'pry'

require_relative 'models/users.rb'
require_relative 'models/donuts.rb'
require_relative 'models/donut_shops.rb'

also_reload 'models/*'

enable :sessions

#home page
get '/' do
  @two_shops = find_two_latest_shops()
  @two_donuts = find_two_latest_donuts()
  erb :index
end

#about me and donuts
get '/about_me' do
  erb :about_me
end

#donut shops main page
get '/wheres_my_donuts' do
  @shops = find_all_donut_shops()
  erb :wheres_my_donuts
end

#donut review page
get '/donuts_for_real' do
  @donuts = find_all_donuts()
  erb :donuts_for_real
end


# Donut shop controller ================================================

#form to add donut shop 
get '/add_donut_shop' do
  erb :add_donut_shop
end

#process of creating donut shop record in the database
post '/create_donut_shop' do
  redirect '/wheres_my_donuts'
end 

#form to edit donut shop
get '/edit_donut_shop' do
  erb :edit_donut_shop
end

#process of updating donut shop record in the database
patch '/update_donut_shop' do
  redirect '/wheres_my_donuts'
end 

#process of deleting a donut shop record in the database
delete '/delete_donut_shop' do 
  redirect '/wheres_my_donuts'
end


# Donut shop controller end ==============================================

# Donut review controller ================================================

#form to add donut shop 
get '/add_donut' do
  erb :add_donut
end

#process of creating donut record in the database
post '/create_donut' do
  redirect '/donuts_for_real'
end 

#form to edit donut
get '/edit_donut' do
  erb :edit_donut
end

#process of updating donut record in the database
patch '/update_donut' do
  redirect '/donuts_for_real'
end 

#process of deleting a donut record in the database
delete '/delete_donut' do 
  redirect '/donuts_for_real'
end

# Donut review controller end ==============================================

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

#form to get sign up information from user
get '/sign_up' do
  erb :sign_up
end

#post upate to the database
post '/sign_up' do
  # raise 'sssdfsdf'
  create_user(params[:email], params[:password])
  redirect '/log_in' #encourage new user to login
end



