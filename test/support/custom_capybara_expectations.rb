class Capybara::Session

  def has_flash_message?(message)
    within '#flash' do
      has_content? message
    end
  end
  
end

CapybaraMiniTestSpec::Matcher.new(:has_flash_message?)



module Capybara::DSL
  
  # Signs a user in by filling the form and submitting.
  # This enables you to get a similar effect as the devise helper
  # modules, which are not accessible from within integration tests.
  def sign_in(user)
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    
    click_button 'Sign in'
  end
  
end
