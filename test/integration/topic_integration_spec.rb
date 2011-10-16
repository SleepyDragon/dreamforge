
describe 'Topic integration' do
  
  describe "show" do
    before do
      topic = Fabricate(:topic)
      visit topic_path(topic)
    end
    
    it "should be successful" do
      page.status_code.must_equal 200
    end
    
    it "should show the topic title in big, shiny and readable letters"
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