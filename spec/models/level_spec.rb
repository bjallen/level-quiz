require 'rails_helper'

RSpec.describe Level, type: :model do
  it "requires a name" do
    level = Level.new
    expect(level).to be_invalid
    expect(level.errors[:name]).to include("can't be blank")
  end
end
