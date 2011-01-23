# @attr [String] name, required
# @attr [Text] description, required
# @attr [Hash] actions, required

class Ability < Gist
  
  validates_format_of :type, :with => /\AAbility\z/
  
  serialize :actions, Hash
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :actions
  validates_format_of :fictional_author, :with => /\A\z/
  
end
