# @attr [String] name is shown in the community, required
# @attr [String] subtitle is shown in the community, optional
# @attr [Category] category is the Category it depends on

class Forum < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :category
  
  belongs_to :category
  
end
