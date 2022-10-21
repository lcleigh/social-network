require_relative 'user'

class UserRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
        sql = 'SELECT id, email_address, username FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])

        users = []

        result_set.each do |record|
            user = User.new
            user.id = record['id']
            user.email_address = record['email_address']
            user.username = record['username']
        
            users << user

        end

        return users        
  
      # Returns an array of User objects.
    end
  
    # # Gets a single record by its ID
    # # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
        sql = 'SELECT id, email_address, username FROM users WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]

        user = User.new
        user.id = record['id']
        user.email_address = record['email_address']
        user.username = record['username']
        
        return user
      # Returns a single User object.
    end
  
    def create(user)
      sql = 'INSERT INTO users (email_address, username) VALUES ($1, $2);'
      sql_params = [user.email_address, user.username]

      DatabaseConnection.exec_params(sql, sql_params)

      return nil
      # doesn't return anything
    end
  
    def delete(id)
        sql = 'DELETE FROM users WHERE id = $1;'
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params)

        return nil
      # returns nothing
    end
  
    def update(user)
        sql = 'UPDATE users SET email_address = $1, username = $2 WHERE id = $3;'
        sql_params = [user.email_address, user.username, user.id]

        DatabaseConnection.exec_params(sql, sql_params)

        return nil
      # returns nothing
    end
    
  end