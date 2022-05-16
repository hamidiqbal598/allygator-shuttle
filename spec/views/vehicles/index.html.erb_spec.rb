require 'rails_helper'

RSpec.describe "vehicles/index", type: :view do
  before(:each) do
    assign(:vehicles, [
      Vehicle.create!(
        route: "Route",
        uid: "Uid",
        station: nil
      ),
      Vehicle.create!(
        route: "Route",
        uid: "Uid",
        station: nil
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    assert_select "tr>td", text: "Route".to_s, count: 2
    assert_select "tr>td", text: "Uid".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
