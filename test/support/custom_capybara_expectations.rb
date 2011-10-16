class Capybara::Session

  def has_flash_message?(message)
    within '#flash' do
      has_content? message
    end
  end
  
end

CapybaraMiniTestSpec::Matcher.new(:has_flash_message?)



module Capybara::DSL
  
  # Signs a user in by filling the user form and submitting.
  # This enables you to get a similar effect like the Devise::TestHelpers, 
  # which are not accessible from within integration tests.
  # Also, you can easily replace the authentication gem later on.
  #
  # @param [User] user the user you would like to sign in or nil if
  #               you want to let this method generate a default user.
  # @return [User] the signed in user.
  def sign_in(user=nil)
    user ||= Fabricate(:user)
    
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    
    click_button 'Sign in'
    user
  end
  
end
