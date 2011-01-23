# @attr [String] name is shown in the community, required
# @attr [String] subtitle is shown in the community, optional

class Category < ActiveRecord::Base
  
  validates_presence_of :name
  
end
