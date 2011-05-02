require 'spec_helper'

describe "Warbands" do
  describe "GET /warbands" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get warbands_path
      response.status.should be(200)
    end
  end
end
