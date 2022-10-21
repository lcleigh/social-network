require 'user_repository'

RSpec.describe UserRepository do
    def reset_users_table
        seed_sql = File.read('spec/seeds_users.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
        connection.exec(seed_sql)
    end
      
    
    before(:each) do 
        reset_users_table
    end
      
    it "returns all users" do
        repo = UserRepository.new

        users = repo.all

        expect(users.length).to eq 2
        expect(users.first.id).to eq '1'
        expect(users.first.email_address).to eq 'dave@gmail.com'
        expect(users.first.username).to eq 'bigdave42'
    end

    it "returns a single user" do
        repo = UserRepository.new

        user = repo.find(2)

        expect(user.id).to eq '2'
        expect(user.email_address).to eq 'anna@hotmail.com'
        expect(user.username).to eq 'lovecats123'
    end

    it "creates a new user" do
        repo = UserRepository.new

        user = User.new
        user.email_address = "terry@gmail.co.uk"
        user.username = 'tez123'

        repo.create(user)

        users = repo.all
        expect(users.last.email_address).to eq "terry@gmail.co.uk"
        expect(users.last.username).to eq "tez123"
    end

    it "deletes a user" do
        repo = UserRepository.new

        repo.delete(1)

        all_users = repo.all
        expect(all_users.length).to eq 1
        expect(all_users.first.email_address).to eq "anna@hotmail.com"
        expect(all_users.first.username).to eq  "lovecats123"
    end

    it "updates a user" do
        repo = UserRepository.new

        user = repo.find(1)
        user.email_address = "dave@aol.com"
        user.username = "davesmith123" 

        repo.update(user)
        updated_user = repo.find(1)

        expect(updated_user.email_address).to eq "dave@aol.com"
        expect(updated_user.username).to eq "davesmith123"
    end
    

end