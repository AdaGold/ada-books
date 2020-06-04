class User < ApplicationRecord
  validates :uid, uniqueness: { scope: :provider}
  validates :username, presence: true

  def self.build_from_github(auth_hash)
    user = User.new
    user.uid = auth_hash["uid"]
    user.provider = auth_hash["provider"]
    user.username = auth_hash["info"]["nickname"]
    user.email = auth_hash["info"]["email"]
    user.avatar = auth_hash["info"]["image"]

    # Note that the user has not been saved.
    # We'll choose to do the saving outside of this method
    return user
  end
end
