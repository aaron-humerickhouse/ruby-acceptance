class BasePage
  def initialize(browser, logger)
    @browser = browser
    @logger = logger
  end

  private

  def validate_url(url)
    fail "User is not at #{url}. Current url: #{@browser.url}" unless @browser.url.match(url)
  end

  def validate_title(title)
    fail "User is not at #{title}. Current title: #{@browser.title}" unless @browser.title.match(title)
  end
end
