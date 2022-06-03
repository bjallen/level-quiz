require 'rails_helper'

RSpec.describe "pillars/show", type: :view do
  before(:each) do
    @pillar = assign(:pillar, Pillar.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
