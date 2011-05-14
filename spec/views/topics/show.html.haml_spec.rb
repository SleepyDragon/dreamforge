require 'spec_helper'

describe "topics/show.html.haml" do
  let(:user) do
    stub_model(User, :name => "Peter Parker", :password => "dude")
  end
  
  before(:each) do
    @category = stub_model(Category, :name => "Our Test Category")
    @forum = stub_model(Forum, :name => "Our Test Forum", :category => @category)
    @posts = []    
    @topic = stub_model(Topic, :title => "Our Test Topic", :forum => @forum, :posts => @posts)
    
    13.times do |i|
      @posts << stub_model(Post, :content => "Post number #{i}: **Strong**", :topic => @topic)
    end
    
    assign(:topic, @topic)
    assign(:posts, @posts)
    
    assign(:user, nil)
    @view.stub(:resource).and_return(user)
    @view.stub(:resource_name).and_return('user')
    @view.stub(:devise_mapping).and_return(Devise.mappings[:user])
  end
  
  context "not logged-in permissions" do
    
    before(:each) do
      @view.stub!(:current_user).and_return(nil)
      @view.stub!(:user_signed_in?).and_return(false)
      
      render
    end
    
    it "should display the correct headline" do
    
      rendered.should have_selector('h2', :content => @topic.title)
    
    end
    
    it "should display the correct breadcrumbs" do
    
      rendered.should have_selector('.breadcrumbs') do |breadcrumb|
    
        breadcrumb.should have_selector('li a', :content => t(:community), :href => forums_path)
        breadcrumb.should have_selector('li', :content => @category.name)
        breadcrumb.should have_selector('li a', :content => @forum.name, :href => forum_path(@forum))
        breadcrumb.should have_selector('li', :content => @topic.title)
    
      end
    
    end
    
    it "should display the first ten posts" do
    
      rendered.should have_selector('table.posts tr') do |post|      
    
        post.should have_selector('td:last-child') do |content|
          content.should contain(/Post number \d.*/)
        end
    
      end
    
    end
    
    
    it "should not enable you to write a new post" do
      rendered.should_not have_selector('textarea.new_post')
    end
    
  end
  
  context "logged-in permissions" do
    
    before(:each) do
      assign(:user, user)
      
      @view.stub!(:current_user).and_return(user)
      @view.stub!(:user_signed_in?).and_return(true)
      
      render
    end
    
    it "should enable you to write a new post" do
      rendered.should have_selector('textarea.new_post')
    end
    
  end
  
  it "should display the corresponding user names"
  
  it "should mark the authors post"
  
  it "should paginate"
  
end