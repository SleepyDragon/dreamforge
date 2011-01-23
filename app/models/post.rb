# @attr [Text] content, required
# @attr [Topic] topic, required
# @attr [User] user, required

class Post < ActiveRecord::Base
  
  validates_presence_of :content
  validates_presence_of :topic
  validates_presence_of :user
  
  belongs_to :topic
  belongs_to :user
  
end
