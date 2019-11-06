require_relative './../actions/navigation_actions'
require_relative './../actions/sign_in_actions'
require_relative './base_user'

class UnauthenticatedUser < BaseUser
  def_delegators :@navigation_actions, :goto_home, :goto_sign_in
  def_delegators :@sign_in_actions, :fill_in_email, :fill_in_password, :submit_login

  def initialize(browser, logger)
    super(browser, logger)

    @navigation_actions = NavigationActions.new(@browser, @logger)
    @sign_in_actions = SignInActions.new(@browser, @logger)
  end
end
