require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      latitude: 1.5,
      longitude: 1.5,
      angle: "MyString",
      vehicle: nil
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[latitude]"

      assert_select "input[name=?]", "location[longitude]"

      assert_select "input[name=?]", "location[angle]"

      assert_select "input[name=?]", "location[vehicle_id]"
    end
  end
end
