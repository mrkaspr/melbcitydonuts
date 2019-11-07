def run_sql(sql)

  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "melbcitydonuts"})
  records = conn.exec(sql)
  conn.close
  return records
  
end

def find_all_donut_shops ()
  return run_sql("SELECT * FROM donut_shops;")
end

def find_two_latest_shops()
  return run_sql("SELECT * FROM donut_shops ORDER BY id DESC LIMIT 2;")
end