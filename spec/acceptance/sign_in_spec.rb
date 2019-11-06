require_relative './../spec_helper'
require_relative './../users/unauthenticated_user'
require_relative './../users/authenticated_user'
require_relative './../pages/home_page'

describe 'Authentication' do
  context 'as an unauthenticated user' do
    let(:user) { UnauthenticatedUser.new(@browser, @logger) }

    it 'can authenticate a user' do
      user.goto_sign_in
      user.fill_in_email('watir_example@example.com')
      user.fill_in_password('password')
      user.submit_login

      expect(HomePage.new(@browser, @logger).current_user_text.text).to eq('watir_example@example.com')
    end
  end

  context 'as an authenticated user' do
    let(:user) { AuthenticatedUser.new(@browser, @logger) }

    before(:each) do
      unauthenticated_user = UnauthenticatedUser.new(@browser, @logger)

      unauthenticated_user.goto_sign_in
      unauthenticated_user.fill_in_email('watir_example@example.com')
      unauthenticated_user.fill_in_password('password')
      unauthenticated_user.submit_login
    end

    it 'can terminate authentication for a user' do
      user.goto_sign_out

      fail 'Forced failure'
    end
  end
end
