require 'plane'

describe Plane do

  it { is_expected.to respond_to :stormy? }

  it { is_expected.to respond_to :stormy_weather }

end
