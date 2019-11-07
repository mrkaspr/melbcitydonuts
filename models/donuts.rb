def find_donut_by_id(id)
  return run_sql("SELECT * FROM donuts WHERE id = #{id};").first
end

def find_all_donuts()
  return run_sql("SELECT * FROM donuts;")
end

def find_two_latest_donuts()
  return run_sql("SELECT * FROM donuts ORDER BY id DESC LIMIT 2;")
end

def delete_donut(id)
  return run_sql("DELETE from donuts WHERE id = #{id};") 
end

#to insert new data
def add_new_donut(donut_name, shop_id, shop_name, review, image)
  run_sql("INSERT INTO donuts (donut_name, shop_id, shop_name, review, image) VALUES ('#{donut_name}', #{shop_id}, '#{shop_name}', '#{review}', '#{image}');")
end

def update_donut (id, donut_name, shop_name, review)
  run_sql("UPDATE donuts set donut_name = '#{donut_name}', shop_name = '#{shop_name}', review = '#{review}' where id = #{id};")
end