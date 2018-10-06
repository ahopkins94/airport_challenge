require 'airport'
require 'plane'

describe Airport do

  it "should receive a landing plane" do
    plane = double("plane", :stormy? => false)
    subject.receive_planes(plane)
    expect(subject.planes).to eq [plane]
  end

  it "should release a plane" do
    plane = double("plane", :stormy? => false)
    subject.receive_planes(plane)
    subject.release_planes(plane)
    expect(subject.planes).to eq []
  end

  it "should not receive a plane when the weather is stormy" do
    plane = double("plane", :stormy? => true)
    subject.receive_planes(plane)
    expect(subject.planes).to eq []
  end

end
