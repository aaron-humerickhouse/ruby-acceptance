require 'forwardable'

class BaseUser
  extend Forwardable

  def initialize(browser, logger)
    @browser = browser
    @logger = logger
  end
end
