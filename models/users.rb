

#session use this to get information from the database
def find_user_by_id(id)
  #return nil unless id #guard condition / early return
  return run_sql("SELECT * FROM users WHERE id = #{id};").first
end

#create new account account
def create_user(email, password)
  # raise 'sdfsdfs'
  password_digest = BCrypt::Password.create(password)
  sql = "INSERT INTO users (email, password_digest) VALUES ('#{email}', '#{password_digest}');"
  #raise sql
  return run_sql(sql)
end

#use to verify admin credentials entered 
def find_user_by_email(email)
  return run_sql("SELECT * FROM users WHERE email = '#{email}';").first
end

def logged_in?

  if current_user
    return true
  else
    return false
  end

end

def current_user
  if session[:id] != nil
    find_user_by_id(session[:id])
  else
   return nil
  end
end