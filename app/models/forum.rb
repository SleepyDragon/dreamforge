# @attr [String] name is shown in the community, required
# @attr [String] subtitle is shown in the community, optional
# @attr [Category] category is the {Category} it depends on
# @attr [Array] topics is a list containg each and every {Topic} depending on it. Will be destroyed, when the forum is destroyed.

class Forum < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :category
  
  belongs_to :category
  has_many :topics, :dependent => :destroy
end
