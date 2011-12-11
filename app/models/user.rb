# The User Model is devise-powered
# Has eMail, Password, Name.
# TODO: GOOD Documentation

class User < ActiveRecord::Base
  devise :database_authenticatable, # encrypts and stores password while signing in
         :registerable, # handles signing up / edit / destroy users through a registration process
         :recoverable, # recover password via email
         :rememberable, # cookies
         :validatable # validate email and password

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :posts

  before_destroy :make_undead

  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true, :format => { :with => /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i}

  def zombie?
    read_attribute(:zombie)
  end

  private

  def make_undead
    write_attribute(:zombie, true)
    write_attribute(:email, nil)

    # Not stored in the database, but as a matter of principle:
    @password = nil
    @password_confirmation = nil

    save(:validate => false)

    # Return false so ActiveRecord will not erase the object from the database.
    return false
  end
end
