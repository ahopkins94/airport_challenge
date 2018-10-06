require_relative "plane"

class Airport

  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_planes(plane)
    if @planes.count < @capacity
      return @planes << plane unless plane.stormy?
    end
  end

  def release_planes(plane)
    return @planes.delete(plane) unless plane.stormy?
  end

  def change_weather_to_stormy
    @planes.each(&:stormy_weather)
  end

end
