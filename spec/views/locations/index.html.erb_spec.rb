require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        latitude: 2.5,
        longitude: 3.5,
        angle: "Angle",
        vehicle: nil
      ),
      Location.create!(
        latitude: 2.5,
        longitude: 3.5,
        angle: "Angle",
        vehicle: nil
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: "Angle".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
