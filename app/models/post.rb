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
    Post.to_html(content)
  end
  
  # @param [Text] text the text you would like to transform to HTML.
  # @return [Text] post formatted as HTML.
  def Post.to_html(text)
    RDiscount.new(text, :filter_html).to_html
  end
  
end
