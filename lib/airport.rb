require_relative "plane"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def receive_planes(plane)
    if @planes.count < 20
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
