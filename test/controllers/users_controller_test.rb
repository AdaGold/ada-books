require "test_helper"

describe UsersController do
  describe "current" do
    it "returns 200 OK for a logged-in user" do
      # Arrange
      user = User.first
      login_data = {
        user: {
          username: user.username
        }
      }

      post login_path, params: login_data

      # Verify the user ID was saved - if that didn't work, this test is invalid
      expect(session[:user_id]).must_equal user.id

      # Act
      get current_user_path

      # Assert
      must_respond_with :success
    end
  end
end
