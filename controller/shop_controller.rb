
# Donut shop controller ================================================

#form to add donut shop 
get '/new_shop' do
  erb :new_shop_form
end


#form to edit donut shop
get '/one_shop' do
  @shop = find_shop_by_id(params[:id])
  erb :edit_shop
end

#process of creating donut shop record in the database
post '/one_shop' do
  redirect '/wheres_my_donuts'
end 

#process of updating donut shop record in the database
patch '/one_shop' do
  redirect '/wheres_my_donuts'
end 

#process of deleting a donut shop record in the database
delete '/one_shop' do 
  delete_shop(params[:id])
  redirect '/wheres_my_donuts'
end


# Donut shop controller end ==============================================
