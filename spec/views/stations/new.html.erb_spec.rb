require 'rails_helper'

RSpec.describe "stations/new", type: :view do
  before(:each) do
    assign(:station, Station.new(
      lattitude: 1.5,
      longitude: 1.5,
      name: "MyString",
      radius: 1.5
    ))
  end

  it "renders new station form" do
    render

    assert_select "form[action=?][method=?]", stations_path, "post" do

      assert_select "input[name=?]", "station[lattitude]"

      assert_select "input[name=?]", "station[longitude]"

      assert_select "input[name=?]", "station[name]"

      assert_select "input[name=?]", "station[radius]"
    end
  end
end
