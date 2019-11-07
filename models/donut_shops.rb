def find_shop_by_id(id)
  return run_sql("SELECT * FROM donut_shops WHERE id = #{id};").first
end

def find_all_donut_shops ()
  return run_sql("SELECT * FROM donut_shops;")
end

def find_two_latest_shops()
  return run_sql("SELECT * FROM donut_shops ORDER BY id DESC LIMIT 2;")
end

def delete_shop(id)
  return run_sql("DELETE from donut_shops WHERE id = #{id};") 
end