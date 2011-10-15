require "spec_helper"

describe Topic do
  it "does require a title" do
    topic_without_a_title = Fabricate.build :topic, :title => nil
    topic_without_a_title.wont_be_valid
  end

  it "does require a forum" do
    topic_without_a_forum = Fabricate.build :topic, :forum => nil
    topic_without_a_forum.wont_be_valid
  end

  it "accepts valid forums" do
    topic_with_a_title_and_forum = Fabricate.build :topic
    topic_with_a_title_and_forum.must_be_valid
  end

  it "does destroy all dependent posts" do
    my_user = Fabricate :user, :name => "dependent_post_check", :email => "dude@me.com"
    topic_with_a_title_and_forum = Fabricate :topic
    valid_post = Fabricate :post, :user => my_user

    Post.all.must_include valid_post
    topic_with_a_title_and_forum.destroy
    topic_with_a_title_and_forum.must_be_nil
    Post.all.wont_include valid_post
  end
end
