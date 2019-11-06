require_relative './../pages/sign_in_page'
require_relative './base_actions'

class SignInActions < BaseActions
  def initialize(browser, logger)
    super(browser, logger)
    @sign_in_page = SignInPage.new(@browser, @logger)
  end

  def fill_in_email(email)
    on_correct_page?
    @logger.info "Filling in email with: #{email}"
    @sign_in_page.email_text_field.set(email)
  end

  def fill_in_password(password)
    on_correct_page?
    @logger.info "Filling in password with: #{password}"
    @sign_in_page.password_text_field.set(password)
  end

  def submit_login
    on_correct_page?
    @logger.info "Clicking login button"
    @sign_in_page.sign_in_button.click
    @sign_in_page.sign_in_button.wait_while(&:present?)
  end

  def on_correct_page?
    @sign_in_page.on_page?
  end
end
