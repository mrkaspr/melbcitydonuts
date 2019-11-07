def run_sql(sql)

  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "melbcitydonuts"})
  records = conn.exec(sql)
  conn.close
  return records

end

def find_all_donuts ()
  return run_sql("SELECT * FROM donuts;")
end

def find_two_latest_donuts()
  return run_sql("SELECT * FROM donuts ORDER BY id DESC LIMIT 2;")
end