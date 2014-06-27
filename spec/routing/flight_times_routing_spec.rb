require "spec_helper"

describe FlightTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/flight_times").should route_to("flight_times#index")
    end

    it "routes to #new" do
      get("/flight_times/new").should route_to("flight_times#new")
    end

    it "routes to #show" do
      get("/flight_times/1").should route_to("flight_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flight_times/1/edit").should route_to("flight_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flight_times").should route_to("flight_times#create")
    end

    it "routes to #update" do
      put("/flight_times/1").should route_to("flight_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flight_times/1").should route_to("flight_times#destroy", :id => "1")
    end

  end
end
