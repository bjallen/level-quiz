require 'rails_helper'

RSpec.describe Behavior, type: :model do
  it "requires a description" do
    behavior = Behavior.new
    expect(behavior).to be_invalid
    expect(behavior.errors[:description]).to include("can't be blank")
  end
end
