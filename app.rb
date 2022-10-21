require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('social_network')

user_repository = UserRepository.new
post_repository = PostRepository.new

#p "All Users: #{user_repository.all}"

#p "User 3: #{user_repository.find(3).username}"

p "Post 1: #{post_repository.find(6).title}"


#p "Post 3: #{post_repository.find(3).title}"

