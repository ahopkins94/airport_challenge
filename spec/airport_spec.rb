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


  it "should be able to not release a plane when the weather is stormy" do
    plane = double("plane", :stormy? => false)
    subject.receive_planes(plane)
    expect(plane).to receive(:stormy_weather)
    subject.change_weather_to_stormy
  end


  it "should not receive a plane when the weather is stormy" do
    plane = double("plane", :stormy? => true)
    subject.receive_planes(plane)
    expect(subject.planes).to eq []
  end

  it "should not receive a plane if the airport is full" do
    plane = double("plane", :stormy? => false)
    20.times {subject.receive_planes(plane)}
    plane2 = double("plane", :stormy? => false)
    subject.receive_planes(plane)
    expect(subject.planes.length).to eq 20
  end

  it "should have a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
