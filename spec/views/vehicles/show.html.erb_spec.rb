require 'rails_helper'

RSpec.describe "vehicles/show", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      route: "Route",
      uid: "Uid",
      station: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Route/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(//)
  end
end
