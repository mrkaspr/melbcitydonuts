require 'sinatra'
require 'pg'
require'bcrypt'


require_relative 'models/users.rb'
require_relative 'models/donuts.rb'
require_relative 'models/donut_shops.rb'

if development?
  also_reload 'models/*'
  also_reload 'controller/*'
  require 'sinatra/reloader' 
  require 'pry'
end 

def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "melbcitydonuts"})
  records = conn.exec(sql)
  conn.close
  return records
end


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


require_relative 'controller/session_controller.rb'
require_relative 'controller/donuts_controller.rb'
require_relative 'controller/shop_controller.rb'
