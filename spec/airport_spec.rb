require 'airport'
require 'plane'

describe Airport do

  describe "#receive_planes" do

    it "should receive a landing plane" do
      plane = double("plane", :stormy? => false)
      subject.receive_planes(plane)
      expect(subject.planes).to eq [plane]
    end

    it "should not receive a plane when the weather is stormy" do
      plane = double("plane", :stormy? => true)
      subject.receive_planes(plane)
      expect(subject.planes).to eq []
    end

    it "should not receive a plane if the airport is at default capacity" do
      plane = double("plane", :stormy? => false)
      Airport::DEFAULT_CAPACITY.times {subject.receive_planes(plane)}
      plane2 = double("plane", :stormy? => false)
      subject.receive_planes(plane)
      expect(subject.planes.length).to eq Airport::DEFAULT_CAPACITY
    end

  end

  describe "#release_planes" do

    it "should release a plane" do
      plane = double("plane", :stormy? => false)
      subject.receive_planes(plane)
      subject.release_planes
      expect(subject.planes).to eq []
    end

    it "should be able to not release a plane when the weather is stormy" do
      plane = double("plane", :stormy? => false)
      subject.receive_planes(plane)
      expect(plane).to receive(:stormy_weather)
      subject.change_weather_to_stormy
    end

    it "should release a plane after stormy weather has become sunny" do
      plane = double("plane", :stormy? => false)
      subject.receive_planes(plane)
      expect(plane).to receive(:stormy_weather)
      subject.change_weather_to_stormy
      expect(plane).to receive(:sunny_weather)
      subject.change_weather_to_sunny
    end

  end

  it "should have a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
