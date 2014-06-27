require 'spec_helper'

describe "flight_times/new" do
  before(:each) do
    assign(:flight_time, stub_model(FlightTime,
      :flight => "MyString"
    ).as_new_record)
  end

  it "renders new flight_time form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flight_times_path, "post" do
      assert_select "input#flight_time_flight[name=?]", "flight_time[flight]"
    end
  end
end
