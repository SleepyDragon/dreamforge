class Story < Gist
  
  validates_format_of :type, :with => /\AStory\z/
  
  validates_presence_of :name
  validates_presence_of :description
  validates_format_of :actions, :with => /\A\z/
  validates_presence_of :fictional_author
  
end
