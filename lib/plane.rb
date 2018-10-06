class Plane

  def initialize
    @weather = [ :sunny, :sunny, :sunny, :sunny, :stormy ].sample
  end

  def stormy?
    @weather == :stormy
  end

  def stormy_weather
    @weather = :stormy
  end

end
