
# Contains simple test helpers to make testing easier.
# Provides methods for an easier handling of devise in specs.
# Took me quite a while to figure this out.
#
# It might be a good idea to prefix each method with 
# 'helper_', so they can't be mistaken with builtin
# helpers.
#
# Usage: 
# Include this module into your controllers.
#
# describe PostsController do
#
#   include DreamforgeSpecHelpers
#   ...
#   helper_sign_in @user
#
module DreamforgeSpecHelpers

  # Signs a user in using the devise spec-helper.
  # The user will be signed in as a normal user.
  def helper_sign_in(user)
    
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
    
  end
  
  
  # Signs a user in as admin.
  def helper_sign_admin_in(user)

    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in user
  
  end
  
end