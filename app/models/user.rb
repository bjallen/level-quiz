class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:okta]

  def self.from_omniauth(auth)
    User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.email = auth["info"]["email"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end
end
