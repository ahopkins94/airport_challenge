require_relative "plane"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def receive_planes(plane)
    @planes << plane
  end

  def release_planes(plane)
    @planes.delete(plane)
  end

end
