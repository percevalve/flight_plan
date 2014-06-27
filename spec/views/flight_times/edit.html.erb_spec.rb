require 'spec_helper'

describe "flight_times/edit" do
  before(:each) do
    @flight_time = assign(:flight_time, stub_model(FlightTime,
      :flight => "MyString"
    ))
  end

  it "renders the edit flight_time form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flight_time_path(@flight_time), "post" do
      assert_select "input#flight_time_flight[name=?]", "flight_time[flight]"
    end
  end
end
