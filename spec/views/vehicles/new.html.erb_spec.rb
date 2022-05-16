require 'rails_helper'

RSpec.describe "vehicles/new", type: :view do
  before(:each) do
    assign(:vehicle, Vehicle.new(
      route: "MyString",
      uid: "MyString",
      station: nil
    ))
  end

  it "renders new vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicles_path, "post" do

      assert_select "input[name=?]", "vehicle[route]"

      assert_select "input[name=?]", "vehicle[uid]"

      assert_select "input[name=?]", "vehicle[station_id]"
    end
  end
end
