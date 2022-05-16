require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      route: "MyString",
      uid: "MyString",
      station: nil
    ))
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do

      assert_select "input[name=?]", "vehicle[route]"

      assert_select "input[name=?]", "vehicle[uid]"

      assert_select "input[name=?]", "vehicle[station_id]"
    end
  end
end
