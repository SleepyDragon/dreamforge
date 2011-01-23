# @attr [String] name is shown in the community, required
# @attr [String] subtitle is shown in the community, optional
# @attr [Array] forums is a list of dependend forums, that will be destroyed, when the area is destroyed

class Category < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :forums, :dependent => :destroy
  
end
