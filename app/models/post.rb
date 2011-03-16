# @attr [Text] content, required
# @attr [Topic] topic, required
# @attr [User] user, required

class Post < ActiveRecord::Base
  
  validates_presence_of :content
  validates_presence_of :topic
  validates_presence_of :user
  
  belongs_to :topic
  belongs_to :user
  
  
  def to_html
    RDiscount.new(content).to_html
  end
  
  def Post.preview(markup_text)
    RDiscount.new(markup_text).to_html
  end
  
end
