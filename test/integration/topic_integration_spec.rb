

describe 'Topic integration' do  
    
  
  describe "show" do
    before do
      @topic = Fabricate(:topic)
      visit topic_path(@topic)
    end
    
    it "should be successful" do
      page.status_code.must_equal 200
    end
    
    it "should show the topic title in big, shiny and readable letters" do
      within 'h2' do
        page.must_have_content @topic.title
      end
    end
    
    describe "not logged in" do
      it "will not greet the user" do
        within '#userbox' do
          page.wont_have_content "Welcome "
        end
      end
      
      it "will give you the possibility to log in" do
        within '#userbox' do
          page.must_have_selector 'a'
          page.must_have_content 'login'
        end
      end
    end
    
    describe "logged in" do
      before do
        @user = Fabricate(:user)
      end
      
      it "will greet the user" do
        sign_in @user
        visit topic_path(@topic)
        
        within '#userbox' do
          page.must_have_content "Welcome #{@user.name}"
        end
      end
    end
    
  end

end


# 
# describe "GET 'show'" do
#   before :each do
#     @topic = stub_model(Topic, :title => "Topic")
#     
#     Topic.stub!(:find).and_return(@topic)
#   end
#   
#   it "should be succesful" do
#     
#     get :show, :id => 1
#     response.should be_success
#     
#   end
# end