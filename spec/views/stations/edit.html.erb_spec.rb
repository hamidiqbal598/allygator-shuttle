require 'rails_helper'

RSpec.describe "stations/edit", type: :view do
  before(:each) do
    @station = assign(:station, Station.create!(
      lattitude: 1.5,
      longitude: 1.5,
      name: "MyString",
      radius: 1.5
    ))
  end

  it "renders the edit station form" do
    render

    assert_select "form[action=?][method=?]", station_path(@station), "post" do

      assert_select "input[name=?]", "station[lattitude]"

      assert_select "input[name=?]", "station[longitude]"

      assert_select "input[name=?]", "station[name]"

      assert_select "input[name=?]", "station[radius]"
    end
  end
end
