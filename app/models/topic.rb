# @attr [String] title is shown in lists and so on, required
# @attr [Forum] forum it belongs to, required

class Topic < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :forum
  
  belongs_to :forum
  
end
