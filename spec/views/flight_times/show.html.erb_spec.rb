require 'spec_helper'

describe "flight_times/show" do
  before(:each) do
    @flight_time = assign(:flight_time, stub_model(FlightTime,
      :flight => "Flight"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Flight/)
  end
end
