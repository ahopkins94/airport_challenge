require_relative "plane"

class Airport

  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_planes(plane)
    if @planes.count < @capacity
      return @planes << plane unless plane.stormy?
    end
  end

  def release_planes
    @planes.pop unless @planes.last.stormy?
  end

  def change_weather_to_stormy
    @planes.each(&:stormy_weather)
  end

  def change_weather_to_sunny
    @planes.each(&:sunny_weather)
  end

end
