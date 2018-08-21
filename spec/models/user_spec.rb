require 'rails_helper'

RSpec.describe User, type: :model do
    
    before(:each) do
        @test_user = {
            :first_name => "Example",
            :last_name => "User",
            :email => "user@example.com",
            :password => "foobar",
            :password_confirmation => "foobar"
        }
    end
    describe 'Validations' do
        it "should create a new user given valid input" do
            expect(User.new(@test_user).valid?).to eq(true)
        end
        it "should require a first name input" do
            @test_user[:first_name] = nil
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should require a last name input" do
            @test_user[:last_name] = nil
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should require an email address" do
            @test_user[:email] = nil
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should only accept unique emails (case insensitive)" do
            User.create!(@test_user)
            @test_user[:email] = @test_user[:email].upcase
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should have a password input" do
            @test_user[:password] = nil
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should have a password confirmation input" do
            @test_user[:password_confirmation] = nil
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should only create a user when passwords match" do
            @test_user[:password_confirmation] = @test_user[:password].upcase
            expect(User.new(@test_user).valid?).to eq(false)
        end
        it "should only permit passwords 6 characters or longer" do
            @test_user[:password] = "12345"
            @test_user[:password_confirmation] = "12345"
            expect(User.new(@test_user).valid?).to eq(false)
        end
    end

    describe '.authenticate_with_credentials' do
        it "should permit user to login if they enter credentials exactly" do
            user = User.create!(@test_user) 
            expect(User.authenticate_with_credentials(@test_user[:email], @test_user[:password])).to eq(user)
        end
        it "should permit user to login if email is entered (case insensitive)" do
            user = User.create!(@test_user) 
            case_insensitive_email = @test_user[:email].upcase
            expect(User.authenticate_with_credentials(case_insensitive_email, @test_user[:password])).to eq(user)
        end
        it "should permit user to login if email is entered with whitespace" do
            user = User.create!(@test_user)
            email_with_whitespace = "  " + @test_user[:email] + "  "
            expect(User.authenticate_with_credentials(email_with_whitespace, @test_user[:password])).to eq(user)
        end
        it "should permit user to login if email is entered with whitespace (case insensitive)" do
            user = User.create!(@test_user)
            email_with_whitespace = "  " + @test_user[:email].upcase + "  "
            expect(User.authenticate_with_credentials(email_with_whitespace, @test_user[:password])).to eq(user)
        end
        it "should not permit user to login if email is entered incorrectly" do
            user = User.create!(@test_user)
            expect(User.authenticate_with_credentials(@test_user[:email], @test_user[:password])).to eq(user)
        end
        it "should not permit user to login if password was incorrect" do
            user = User.create!(@test_user)
            wrong_password = "hahahaxorm4n"
            expect(User.authenticate_with_credentials(@test_user[:email], wrong_password)).to eq(nil)
        end
    end
        
end