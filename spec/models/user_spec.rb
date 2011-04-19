require 'spec_helper'

describe User do
  
  let(:user_without_email) { User.new(:name => "Nickname", :password => "foobar", :password_confirmation => "foobar") }
  let(:user_without_password) { User.new(:name => "Nickname", :email => "foo@example.com", :password_confirmation => "foobar") }
  let(:user_without_correct_password_confirmation) { User.new(:name => "Nickname", :email => "foo@example.com", :password => "foobar", :password_confirmation => "baz") }
  let(:user_without_name) { User.new(:email => "foo@example.com", :password => "foobar", :password_confirmation => "foobar") }
  let(:user_with_all_information) { User.new(:name => "Nickname", :email => "foo@example.com", :password => "foobar", :password_confirmation => "foobar") }
  
  context "validations" do
    context "nickname" do
      it "requires a nickname" do
        user_without_name.should_not be_valid
      end

      it "rejects new users with a nickname that's already taken" do
        user_with_all_information.save

        expect do
          User.create(:name => "Nickname", :email => "another_email@example.com", :password => "foobaz", :password_confirmation => "foobaz")
        end.to_not change(User, :count).by(1)
      end    

      it "should ignore the case when comparing nicknames" do
        user_with_all_information.save

        expect do
          User.create(:name => "NiCkName", :email => "another_email@example.com", :password => "foobaz", :password_confirmation => "foobaz")
        end.to_not change(User, :count).by(1)
      end
    end

    context "email-adress" do
      it "requires an email" do
        user_without_email.should_not be_valid
      end

      it "accepts a valid email-address" do
        valid_email_addresses = ["test@example.com", "fore.last@test.com"]

        valid_email_addresses.each do |email|
          user_without_email.email = email
          user_without_email.should be_valid
        end
      end

      it "rejects an invalid email-address" do
        invalid_email_addresses = ["test@example", "@example.com", "hei-o-p#ei@example.com"]

        invalid_email_addresses.each do |email|
          user_without_email.email = email
          user_without_email.should_not be_valid
        end    
      end

      it "rejects new users with an email that's already taken" do
        user_with_all_information.save

        expect do
          User.create(:name => "Unnamed", :email => "foo@example.com", :password => "foobaz", :password_confirmation => "foobaz")
        end.to_not change(User, :count).by(1)
      end

      it "should ignore the case when comparing email-addresses" do
        user_with_all_information.save

        expect do
          User.create(:name => "Unnamed", :email => "Foo@ExAmple.COM", :password => "foobaz", :password_confirmation => "foobaz")
        end.to_not change(User, :count).by(1)
      end
    end

    context "password" do
      it "requires a password" do
        user_without_password.should_not be_valid
      end

      it "requires a matching password and password confirmation" do
        user_without_correct_password_confirmation.should_not be_valid
      end

      it "rejects passwords that are too short" do
        short_pw = 'a' * 5
        user_without_password.password = short_pw
        user_without_password.password_confirmation = short_pw

        user_without_password.should_not be_valid
      end

      it "accepts passwords that are long enough" do
        quite_long_passwords = ['a' * 6, 'b' * 8, 'c' * 12]

        quite_long_passwords.each do |pw|
          user_without_password.password = pw
          user_without_password.password_confirmation = pw

          user_without_password.should be_valid
        end
      end
    end

    it "accepts a user with all information" do
      user_with_all_information.should be_valid
    end    
  end
  
  context "on delete" do
    before :each do
      @user = user_with_all_information
      @user.save
    end
    
    it "should not erase the entry from the database" do
      expect do
        @user.destroy
      end.to_not change(User, :count).by(-1)
    end
    
    it "should set the zombie-attribute to true" do
      @user.zombie?.should be_false
      @user.destroy
      @user.zombie?.should be_true
    end
    
    it "it should keep the name" do
      @user.destroy
      @user.name.should == "Nickname"
    end
    
    it "should erase the email" do
      @user.destroy
      @user.email.should be_nil
    end
    
    it "should erase the password" do
      @user.destroy
      @user.password.should be_nil
    end
    
    it "should erase the password confirmation" do
      @user.destroy
      @user.password_confirmation.should be_nil
    end
    
  end
  
end
