require 'active_support'
require_relative './../actions/navigation_actions'
require_relative './base_user'

class AuthenticatedUser < BaseUser
  def_delegators :@navigation_actions, :goto_home, :goto_addresses, :goto_sign_out

  def initialize(browser, logger)
    super(browser, logger)

    @navigation_actions = NavigationActions.new(@browser, @logger)
  end
end
