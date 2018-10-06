class Plane

  def initialize
    @weather = [ :sunny, :sunny, :sunny, :sunny, :stormy ].sample
  end

  def stormy?
    @weather == :stormy
  end

end
