require 'spec_helper'

describe User do
  # TODO: email uniqueness case-insensitive
  # TODO: password should have a minimum length
  # TODO: user should have and require a (case-insensitive) unique username
  
  let(:user_without_email) { User.new(:password => "foobar", :password_confirmation => "foobar") }
  let(:user_without_password) { User.new(:email => "foo@example.com", :password_confirmation => "foobar") }
  let(:user_without_correct_password_confirmation) { User.new(:email => "foo@example.com", :password => "foobar", :password_confirmation => "baz") }
  let(:user_with_all_information) { User.new(:email => "foo@example.com", :password => "foobar", :password_confirmation => "foobar") }
  
  it "requires an email" do
    user_without_email.should_not be_valid
  end
  
  it "requires a valid email-address" do
    invalid_email_addresses = ["test@example", "@example.com", "hei-o-p#ei@example.com"]
    valid_email_addresses = ["test@example.com", "fore.last@test.com"]
    
    invalid_email_addresses.each do |email|
      user_without_email.email = email
      user_without_email.should_not be_valid
    end
    
    valid_email_addresses.each do |email|
      user_without_email.email = email
      user_without_email.should be_valid
    end
  end
  
  it "requires a password" do
    user_without_password.should_not be_valid
  end
  
  it "requires a matching password and password confirmation" do
    user_without_correct_password_confirmation.should_not be_valid
  end
  
  it "accepts a user with all information" do
    user_with_all_information.should be_valid
  end
  
end
