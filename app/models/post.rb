# @attr [Text] content, required. Should be written as Markdown.
# @attr [Topic] topic, required
# @attr [User] user, required

class Post < ActiveRecord::Base
  
  validates_presence_of :content
  validates_presence_of :topic
  validates_presence_of :user
  
  belongs_to :topic
  belongs_to :user
  
  # @return [Text] post formatted as HTML.
  def to_html
    Post.preview(content)
  end
  
  # @param [Text] text the content of a post you would like to generate a preview for.
  # @return [Text] post formatted as HTML.
  def Post.preview(text)
    RDiscount.new(text, :filter_html).to_html
  end
  
end
