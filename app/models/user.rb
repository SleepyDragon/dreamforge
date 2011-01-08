class User < ActiveRecord::Base
  devise :database_authenticatable, # encrypts and stores password while signing in
         :registerable, # handles signing up / edit / destroy users through a registration process
         :recoverable, # recover password via email
         :rememberable, # cookies
         :trackable, # tracks sign in count, timestamps and ip adress
         :validatable, # validate email and password
         :confirmable # email confirm process

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
