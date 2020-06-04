ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/autorun'
require 'minitest/reporters'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def setup
    OmniAuth.config.test_mode = true
  end

  def mock_auth_hash(user)
    return {
      provider: user.provider,
      uid: user.uid,
      info: {
        nickname: user.username,
        email: user.email,
        image: user.avatar,
      },
    }
  end




  # Helper method that performs a log-in with either
  # a passed-in user or the first test user
  def perform_login(user = nil)
    user ||= User.first
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))

    # Act Try to call the callback route
    get omniauth_callback_path(:github)

    user = User.find_by(uid: user.uid, username: user.username)
    expect(user).wont_be_nil

    # Verify the user ID was saved - if that didn't work, this test is invalid
    expect(session[:user_id]).must_equal user.id

    return user
  end
end