require 'spec_helper'

describe Post do
  
  let(:post_without_user) { Post.new(:topic => existing_topic, :content => "Lorem ipsum dolor sit amet") }
  let(:post_without_content) { Post.new(:topic => existing_topic, :user => existing_user) }
  let(:post_without_topic) { Post.new(:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :user => existing_user) }
  let(:post_with_all_information) { Post.new(:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :topic => existing_topic, :user => existing_user) }
  let(:existing_topic) { Topic.new(:title => "Absolutly gentle title") }
  let(:existing_user) { User.new(:email => "hello@hello.de", :password => "testtest", :password_confirmation => "testtest") }
  
  it "does require content" do
    post_without_content.should_not be_valid
  end
  
  it "does require a topic" do
    post_without_topic.should_not be_valid
  end
  
  it "does require a user" do
    post_without_user.should_not be_valid
  end
  
  it "accepts a post with all information" do
     post_with_all_information.should be_valid
  end
  
  
  context 'presentation layer' do
    
    let(:post) { Post.new(:topic => existing_topic, :user => existing_user, :content => simple_text) }
    let(:simple_text) { "Hello world!" }
    let(:text_with_html) { "<h1>Hi</h1>" }
    
    it "provides a to_html method" do
      post.should respond_to(:to_html)
    end
    
    it "generates HTML from markdown-formatted text" do
      post.to_html.should == "<p>#{simple_text}</p>\n"
    end
    
    it "provides a preview" do
      # Does not need a user or topic, hence classmethod.
      Post.to_html(simple_text).should == post.to_html
    end
    
    it "should escape HTML userinput" do
      Post.to_html(text_with_html).should == "<p>&lt;h1>Hi&lt;/h1></p>\n"
    end
    
    context "post content" do
      
      let(:content_with_link) { "This is a [link](http://example.com 'alt text')." }
      let(:content_with_italic_text) { "Hello *world*!" }
      let(:content_with_strong_text) { "Hello **strong** world!" }
      let(:content_with_quotes) { "Hello quoted text\n>This is quoted  \n>- Sir" }
      
      it "supports hyperlinks" do
        Post.to_html(content_with_link).should == "<p>This is a <a href=\"http://example.com\" title=\"alt text\">link</a>.</p>\n"
      end
      
      it "allows to emphasize text" do
        Post.to_html(content_with_italic_text).should == "<p>Hello <em>world</em>!</p>\n"
      end
      
      it "allows to make text STRONG" do
        Post.to_html(content_with_strong_text).should == "<p>Hello <strong>strong</strong> world!</p>\n"
      end
      
      it "allows to quote text" do
        Post.to_html(content_with_quotes).should == "<p>Hello quoted text</p>\n\n<blockquote><p>This is quoted<br/>\n- Sir</p></blockquote>\n"
      end
      
      
    end
  end
  
end
