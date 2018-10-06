require_relative "plane"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def receive_planes(plane)
    return @planes << plane unless plane.stormy?
  end

  def release_planes(plane)
    @planes.delete(plane)
  end

end
