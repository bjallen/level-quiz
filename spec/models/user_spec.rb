require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a new user from the SSO response" do
    auth = {
      "provider" => "asdf",
      "uid" => "29nvisyhd",
      "info" => {
        "email" => "person@stuff.com"
      }
    }
    expect {
      User.from_omniauth(auth)
    }.to change(User, :count).by(1)
  end

  it "doesn't create duplicate users from the SSO response" do
    auth = {
      "provider" => "asdf",
      "uid" => "29nvisyhd",
      "info" => {
        "email" => "person@stuff.com"
      }
    }
    User.from_omniauth(auth)
    expect {
      User.from_omniauth(auth)
    }.to_not change(User, :count)
  end
end
