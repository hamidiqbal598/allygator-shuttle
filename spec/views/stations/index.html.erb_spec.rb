require 'rails_helper'

RSpec.describe "stations/index", type: :view do
  before(:each) do
    assign(:stations, [
      Station.create!(
        lattitude: 2.5,
        longitude: 3.5,
        name: "Name",
        radius: 4.5
      ),
      Station.create!(
        lattitude: 2.5,
        longitude: 3.5,
        name: "Name",
        radius: 4.5
      )
    ])
  end

  it "renders a list of stations" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 4.5.to_s, count: 2
  end
end
