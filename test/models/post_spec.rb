describe Post do
  it "does require content" do
    post_without_content = Fabricate.build :post, :content => nil
    post_without_content.wont_be_valid
  end

  it "does require a topic" do
    post_without_topic = Fabricate.build :post, :topic => nil
    post_without_topic.wont_be_valid
  end

  it "does require a user" do
    post_without_user = Fabricate.build :post, :user => nil
    post_without_user.wont_be_valid
  end

  it "accepts a post with all information" do
    post_with_all_information = Fabricate.build :post
    post_with_all_information.must_be_valid
  end

  it "provides a to_html method" do
    post = Fabricate.build :post
    post.must_respond_to(:to_html)
  end

  it "generates HTML from markdown-formatted text" do
    simple_text = "Ay, Matey!"
    post = Fabricate.build :post, :content => simple_text
    post.to_html.must_equal "<p>#{simple_text}</p>\n"
  end

  it "provides a preview" do
    # Does not need a user or topic, hence classmethod.
    simple_text = "Ay, Matey!"
    post = Fabricate.build :post, :content => simple_text
    Post.to_html(simple_text).must_equal post.to_html
  end

  it "must_escape HTML userinput" do
    text_with_html = "<h1>Hi</h1>"
    Post.to_html(text_with_html).must_equal "<p>&lt;h1>Hi&lt;/h1></p>\n"
  end

  it "supports hyperlinks" do
    content_with_link = "This is a [link](http://example.com 'alt text')."
    Post.to_html(content_with_link).must_equal "<p>This is a <a href=\"http://example.com\" title=\"alt text\">link</a>.</p>\n"
  end

  it "allows to emphasize text" do
    content_with_italic_text = "Hello *world*!"
    Post.to_html(content_with_italic_text).must_equal "<p>Hello <em>world</em>!</p>\n"
  end

  it "allows to make text STRONG" do
    content_with_strong_text = "Hello **strong** world!"
    Post.to_html(content_with_strong_text).must_equal "<p>Hello <strong>strong</strong> world!</p>\n"
  end

  it "allows to quote text" do
    content_with_quotes = "Hello quoted text\n>This is quoted  \n>- Sir"
    Post.to_html(content_with_quotes).must_equal "<p>Hello quoted text</p>\n\n<blockquote><p>This is quoted<br/>\n- Sir</p></blockquote>\n"
  end
end

