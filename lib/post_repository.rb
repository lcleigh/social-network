require_relative 'post'

class PostRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
        sql = 'SELECT id, title, content, view_number, user_id FROM posts;'
        result_set = DatabaseConnection.exec_params(sql, [])

        posts = []

        result_set.each do |record|
            post = Post.new
            post.id = record['id']
            post.title = record['title'] 
            post.content = record['content'] 
            post.view_number = record['view_number'] 
            post.user_id = record['user_id'] 

            posts << post
        end

        return posts
  
      # Returns an array of User objects.
    end
  
    # # Gets a single record by its ID
    # # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
        sql = 'SELECT id, title, content, view_number, user_id FROM posts WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)
        
        record = result_set[0]

        
        post = Post.new
        post.id = record['id']
        post.title = record['title'] 
        post.content = record['content'] 
        post.view_number = record['view_number'] 
        post.user_id = record['user_id'] 

           
        

        return post
  
      # Returns a single Post object.
    end
  
    def create(post)
        sql = 'INSERT INTO posts (title, content, view_number) VALUES ($1, $2, $3);'
        sql_params = [post.title, post.content, post.view_number]

        DatabaseConnection.exec_params(sql, sql_params)

        return nil
      # doesn't return anything'
    end
  
    def delete(id)
        sql = 'DELETE FROM posts WHERE id = $1;'
        

        DatabaseConnection.exec_params(sql, [id])
        return nil
    end
  
    # def update(user)
    #   # UPDATE posts SET title = $1, content = $2, view_number = $3 WHERE id = $4;
    #   # returns nothing
    # end
    
  end