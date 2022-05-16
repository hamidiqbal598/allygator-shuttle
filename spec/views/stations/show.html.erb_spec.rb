require 'rails_helper'

RSpec.describe "stations/show", type: :view do
  before(:each) do
    @station = assign(:station, Station.create!(
      lattitude: 2.5,
      longitude: 3.5,
      name: "Name",
      radius: 4.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/4.5/)
  end
end
