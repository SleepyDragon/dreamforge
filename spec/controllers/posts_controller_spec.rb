require 'spec_helper'

describe PostsController do
  
  include DreamforgeSpecHelpers
  
  before(:each) do
    @user = User.new
    
    @post = Post.new
    @post.stubs(:user => @user, :content => 'hello there!', :topic => Topic.new)
  end

  describe "POST 'create'" do
    
    before(:each) do
      # TODO: use mocking instead
      @category = Category.create! :name => 'category'
      @forum = Forum.create! :name => "forum", :category => @category
      @topic = Topic.create! :title => 'topic', :forum => @forum
      
      @params = { :topic_id => @topic, :content => 'this is a post' }
    end
    
    context "when signed in" do
      
      before(:each) do
        @user = User.create :name => "testuser", :email => "testemail@example.com", :password => "foobar"
        helper_sign_in @user
      end
      
      it "should create a new post" do
        expect do
          post :create, :post => @params
        end.to change(Post, :count).by(1)
      end
      
      it "should redirect to the topic where the post was created" do
        post :create, :post => @params
        response.should redirect_to topic_path(@topic)
      end
     
    end
    
    context "when not signed in" do
      
      it "should not create a new post" do
        expect do
          post :create, :post => @params
        end.to change(Post, :count).by(0)
      end
      
      it "should redirect to the landing-page" do
        post :create, :post => @params
        response.should redirect_to new_user_session_path
      end
      
    end
    
  end

end
