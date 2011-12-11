# @attr [String] name, required
# @attr [Text] description, required

class Race < Gist
  validates_format_of :type, :with => /\ARace\z/

  validates_presence_of :name
  validates_presence_of :description
  validates_format_of :actions, :with => /\A\z/
  validates_format_of :fictional_author, :with => /\A\z/
end
