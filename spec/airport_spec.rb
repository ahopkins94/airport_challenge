require 'airport'
require 'plane'

describe Airport do

  it "should receive landing plans" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.receive_plane(plane)).to eq plane
  end

end
