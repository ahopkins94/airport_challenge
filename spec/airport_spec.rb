require 'airport'
require 'plane'

describe Airport do

  it "should receive landing planes" do
    plane = Plane.new
    expect(subject.receive_planes(plane)).to eq [plane]
  end

end
