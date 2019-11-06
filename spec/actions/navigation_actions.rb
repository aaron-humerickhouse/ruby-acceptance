require_relative './base_actions'

HOST = 'http://a.testaddressbook.com'

class NavigationActions < BaseActions
  def goto_sign_in
    goto_url "#{HOST}/sign_in"
  end

  def goto_sign_out
    goto_url "#{HOST}/sign_out"
  end

  def goto_home
    goto_url HOST
  end

  def goto_addresses
    goto_url "#{HOST}/addresses"
  end

  private

  def goto_url(url)
    @logger.info "Navigating to #{url}"
    @browser.goto url
  end
end
