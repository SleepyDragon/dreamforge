# The User Model is devise-powered
# Has eMail, Password, Name, ShortDescription. 
# TODO: GOOD Documentation

class User < ActiveRecord::Base
  devise :database_authenticatable, # encrypts and stores password while signing in
         :registerable, # handles signing up / edit / destroy users through a registration process
         :recoverable, # recover password via email
         :rememberable, # cookies
         :trackable, # tracks sign in count, timestamps and ip adress
         :validatable, # validate email and password
         :confirmable # email confirm process

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :short_description
  
  has_many :posts
  
  before_destroy :make_undead
  
  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }
  
  def zombie?
    read_attribute(:zombie)
  end
  
  private
    
  def make_undead
    write_attribute(:zombie, true)
    # delete email, , password, cookies, ...
    return false # prevent from deletion
  end
end
