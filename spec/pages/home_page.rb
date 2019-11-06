require_relative './base_page'

class HomePage < BasePage
  def on_page?
    validate_title 'Address Book'
    validate_url 'http(s)?://a.testaddressbook.com/'
  end

  def current_user_text
    @browser.element(css: "*[data-test='current-user']")
  end
end
