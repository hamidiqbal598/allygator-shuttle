require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      latitude: 2.5,
      longitude: 3.5,
      angle: "Angle",
      vehicle: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Angle/)
    expect(rendered).to match(//)
  end
end
