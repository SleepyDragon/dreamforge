# The Gist uses SingleTableInheritance and should not be created without type

class Gist < ActiveRecord::Base
  belongs_to :topic
end
