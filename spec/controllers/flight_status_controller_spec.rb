require 'spec_helper'

describe FlightStatusController do

  describe "GET 'overview'" do
    it "returns http success" do
      get 'overview'
      response.should be_success
    end
  end

  describe "GET 'daily'" do
    it "returns http success" do
      get 'daily'
      response.should be_success
    end
  end

end
