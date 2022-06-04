require 'rails_helper'

RSpec.describe Competency, type: :model do
  it "requires a name" do
    competency = Competency.new
    expect(competency).to be_invalid
    expect(competency.errors[:name]).to include("can't be blank")
  end
end
