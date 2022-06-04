require 'rails_helper'

RSpec.describe Pillar, type: :model do
  it "requires a name" do
    pillar = Pillar.new
    expect(pillar).to be_invalid
    expect(pillar.errors[:name]).to include("can't be blank")
  end
end
