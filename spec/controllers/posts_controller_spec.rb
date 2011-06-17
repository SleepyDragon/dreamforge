require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers

  before(:each) do
    @user = Factory(:user)
    @post = Factory(:post, :user => @user)
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    
    it "should create a new post when logged in" do

      sign_in @user
      
      expect do
        post :create, :post => @post
      end.to change(Post, :count).by(1)
      
      # response.should redirect_to(topics_path(assigns :topic))
    end
    
  end

end
