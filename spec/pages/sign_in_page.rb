require_relative './base_page'

class SignInPage < BasePage
  def on_page?
    validate_title 'Address Book - Sign In'
    validate_url 'http(s)?://a.testaddressbook.com/sign_in'
  end

  def email_text_field
    @browser.text_field(id: 'session_email')
  end

  def password_text_field
    @browser.text_field(id: 'session_password')
  end

  def sign_in_button
    @browser.button(name: 'commit')
  end
end
