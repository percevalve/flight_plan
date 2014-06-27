require 'spec_helper'

describe "flight_times/index" do
  before(:each) do
    assign(:flight_times, [
      stub_model(FlightTime,
        :flight => "Flight"
      ),
      stub_model(FlightTime,
        :flight => "Flight"
      )
    ])
  end

  it "renders a list of flight_times" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Flight".to_s, :count => 2
  end
end
