require 'airport'
require 'plane'

describe Airport do

  it "should receive landing planes" do
    plane = Plane.new
    expect(subject.receive_planes(plane)).to eq [plane]
  end

  it "should release planes" do
    plane = Plane.new
    subject.receive_planes(plane)
    subject.release_planes(plane)
    expect(subject.planes).to eq []
  end

end
