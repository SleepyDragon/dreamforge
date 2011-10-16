

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
          page.wont_have_content I18n.t('user.welcome', username: "")
        end
      end
      
      it "will give you the possibility to log in" do
        within '#userbox' do
          page.must_have_selector 'a'
          page.must_have_content I18n.t('user.login')
        end
      end
    end
    
    describe "logged in" do
      before do
        @user = sign_in
        visit topic_path(@topic)
      end
      
      it "will greet the user" do
        within '#userbox' do
          page.must_have_content I18n.t('user.welcome', username: @user.name)
        end
      end
    end
    
  end

end

