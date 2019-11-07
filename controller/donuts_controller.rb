
# Donut review controller ================================================

#form to add donut shop 
get '/new_donut' do
  erb :new_donut_form
end

post '/new_donut' do
  add_new_donut(params[:donut_name], params[:shop_id], params[:shop_name], params[:review], params[:image])
  redirect '/donuts_for_real'
end

#form to edit donut
get '/one_donut' do
  
  @donut = find_donut_by_id(params[:id])
  erb :edit_donut
end

#process of creating donut record in the database
post '/one_donut' do
  redirect '/donuts_for_real'
end 

#process of updating donut record in the database
patch '/one_donut' do

  update_donut(params[:id], params[:donut_name], params[:shop_name], params[:review])
  #need to insect a function of edit my sql database

  redirect '/donuts_for_real'
end 

#process of deleting a donut record in the database
delete '/one_donut' do 
  #raise params.to_s
  delete_donut(params[:id])
  redirect '/donuts_for_real'
end

# Donut review controller end ==============================================
