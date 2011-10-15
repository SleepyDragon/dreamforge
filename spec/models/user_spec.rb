require 'spec_helper'

describe User do
  #let(:user_without_email) { User.new(:name => "Nickname", :password => "foobar", :password_confirmation => "foobar") }
  #let(:user_without_password) { User.new(:name => "Nickname", :email => "foo@example.com", :password_confirmation => "foobar") }
  #let(:user_without_correct_password_confirmation) { User.new(:name => "Nickname", :email => "foo@example.com", :password => "foobar", :password_confirmation => "baz") }
  #let(:user_without_name) { User.new(:email => "foo@example.com", :password => "foobar", :password_confirmation => "foobar") }
  #let(:user_with_all_information) { User.new(:name => "Nickname", :email => "foo@example.com", :password => "foobar", :password_confirmation => "foobar") }

  it "requires a nickname" do
    user_without_name = Fabricate.build :user, :name => nil
    user_without_name.wont_be_valid
  end

  it "rejects new users with a nickname that's already taken" do
    user_with_all_information = Fabricate :user

    user_with_same_name = Fabricate.build :user, :email => "another_email@example.com", :password => "foobaz", :password_confirmation => "foobaz"
    user_with_same_name.wont_be_valid
  end

  it "should ignore the case when comparing nicknames" do
    user_with_all_information = Fabricate :user, :name => "Hallo"
    user_with_all_information.save

    user_with_same_name = Fabricate.build :user, :name => "hallo", :email => "another_email@example.com", :password => "foobaz", :password_confirmation => "foobaz"
    user_with_same_name.wont_be_valid
  end
  it "requires an email" do
    user_without_email = Fabricate.build :user, :email => nil
    user_without_email.wont_be_valid
  end

  it "accepts a valid email-address" do
    user_with_all_information = Fabricate.build :user
    valid_email_addresses = ["test@example.com", "fore.last@test.com"]

    valid_email_addresses.each do |email|
      user_with_all_information.email = email
      user_with_all_information.must_be_valid
    end
  end

  it "rejects an invalid email-address" do
    user_with_all_information = Fabricate.build :user
    invalid_email_addresses = ["test@example", "@example.com"]

    invalid_email_addresses.each do |email|
      user_with_all_information.email = email
      user_with_all_information.wont_be_valid
    end
  end

  it "rejects new users with an email that's already taken" do
    user_with_all_information = Fabricate :user

    user_with_same_email = Fabricate.build :user, :name => "Jack Sparrow"
    user_with_same_email.wont_be_valid
  end

  it "should ignore the case when comparing email-addresses" do
    user_with_all_information = Fabricate :user, :email => "jack@sparrow.com"

    user_with_same_email = Fabricate.build :user, :name => "Jack Sparrow", :email => "JACK@sparrow.com"
    user_with_same_email.wont_be_valid
  end

  it "requires a password" do
    user_without_password = Fabricate.build :user, :password => nil
    user_without_password.wont_be_valid
  end

  it "requires a matching password and password confirmation" do
    user_without_correct_password_confirmation = Fabricate.build :user, :password => "foo", :password_confirmation => "bar"
    user_without_correct_password_confirmation.wont_be_valid
  end

  it "rejects passwords that are too short" do
    short_pw = 'a' * 5
    user_with_short_password = Fabricate.build :user, :password => short_pw, :password_confirmation => short_pw
    user_with_short_password.wont_be_valid
  end

  it "accepts a user with all information" do
    user_with_all_information = Fabricate.build :user
    user_with_all_information.must_be_valid
  end

  it "should not erase the entry from the database" do
    user_with_all_information = Fabricate :user

    number_of_users_before_destroy = User.count

    user_with_all_information.destroy

    User.count.must_equal number_of_users_before_destroy
  end

  it "should set the zombie-attribute to true" do
    user_with_all_information = Fabricate :user
    user_with_all_information.zombie?.must_equal false
    user_with_all_information.destroy
    user_with_all_information.zombie?.must_equal true
  end

  it "it should keep the name" do
    user_with_all_information = Fabricate :user, :name => "Jack Sparrow"
    user_with_all_information.destroy
    user_with_all_information.name.must_equal "Jack Sparrow"
  end

  it "should erase the email" do
    user_with_all_information = Fabricate :user
    user_with_all_information.destroy
    user_with_all_information.email.must_be_nil
  end

  it "should erase the password" do
    user_with_all_information = Fabricate :user
    user_with_all_information.destroy
    user_with_all_information.password.must_be_nil
  end

  it "should erase the password confirmation" do
    user_with_all_information = Fabricate :user
    user_with_all_information.destroy
    user_with_all_information.password_confirmation.must_be_nil
  end
end

