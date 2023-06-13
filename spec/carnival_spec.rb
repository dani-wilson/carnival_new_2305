require 'pry'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @carnival = Carnival.new(14, [@ride1, @ride2, @ride3])
    
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor3.add_preference(:thrilling)
    @visitor3.add_preference(:gentle)
    
  end

  it 'exists and has attributes' do
    expect(@carnival).to be_a(Carnival)
    expect(@carnival.duration).to eq(14)
    expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
  end

  it  'can list its most popular ride' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor3)

    @ride2.board_rider(@visitor3)
    @ride2.board_rider(@visitor3)

    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)

    expect(@carnival.most_popular_ride).to eq(@ride3) 
    #it's returning the correct ride, there's just a minor difference??!?!!!
  end

  it 'can list its most profitable ride' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor3)

    @ride2.board_rider(@visitor3)
    @ride2.board_rider(@visitor3)

    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)

    expect(@carnival.most_profitable_ride).to eq(@ride3)
  end

  it 'can tell the total revenue of the carnival' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor3)
    @ride2.board_rider(@visitor3)
    @ride2.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    expect(@carnival.total_revenue).to eq(20)
  end
end