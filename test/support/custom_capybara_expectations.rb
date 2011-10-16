class Capybara::Session
  def has_flash_message?(message)
    within '#flash' do
      has_content? message
    end
  end
end

CapybaraMiniTestSpec::Matcher.new(:has_flash_message?)
