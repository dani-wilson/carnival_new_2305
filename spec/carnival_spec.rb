require 'pry'
require 'visitor'
require 'ride'
require 'carnival'

RSpec.describe Carnival do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @carnival = Carnival.new(14, [@ride1, @ride2, @ride3])
  end

  it 'exists and has attributes' do
    expect(@carnival).to be_a(Carnival)
    expect(@carnival.duration).to eq(14)
    expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
  end
end