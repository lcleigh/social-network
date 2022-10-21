require 'post_repository'

RSpec.describe PostRepository do
    def reset_posts_table
        seed_sql = File.read('spec/seeds_users.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
        connection.exec(seed_sql)
    end
      
    
    before(:each) do 
        reset_posts_table
    end

    it "returns all posts" do
        repo = PostRepository.new

        posts = repo.all

        expect(posts.length).to eq 2
        expect(posts.first.id).to eq '1'
        expect(posts.first.title).to eq 'My day'
        expect(posts.first.content).to eq 'I have had a good day'
        expect(posts.first.view_number).to eq '7'

    end

    it "returns a single post" do
        repo = PostRepository.new

        post = repo.find(1)

        expect(post.id).to eq '1'
        expect(post.title).to eq 'My day'
        expect(post.content).to eq 'I have had a good day'
        expect(post.view_number).to eq '7'

    end

    it "creates a single post" do
        repo = PostRepository.new

        post = Post.new
        post.title = "Tomorrow"
        post.content = 'I am going to Alton Towers.'
        post.view_number = '3'

        repo.create(post)

        posts = repo.all
        expect(posts.last.title).to eq "Tomorrow"
        expect(posts.last.content).to eq 'I am going to Alton Towers.'
        expect(posts.last.view_number).to eq '3'
    end

    it "deletes a post" do
        repo = PostRepository.new

        repo.delete(1)

        all_posts = repo.all
        expect(all_posts.length).to eq 1
        expect(all_posts.first.title).to eq "Work"
        expect(all_posts.first.content).to eq "I went to work today"
        expect(all_posts.first.view_number).to eq '40'

    end
end