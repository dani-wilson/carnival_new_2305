require 'pry'
require 'visitor'
require 'ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor1.add_preference(:gentle)
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor3.add_preference(:thrilling)
  end

  it 'exists and has attributes' do
    expect(@ride1).to be_a(Ride)
    expect(@ride1.name).to eq("Carousel")
    expect(@ride1.min_height).to eq(24)
    expect(@ride1.admission_fee).to eq(1)
    expect(@ride1.excitement).to eq(:gentle)
  end

  it 'starts with zero total revenue' do
    expect(@ride1.revenue).to eq(0)
  end

  it 'can allow visitors to board rides and keep track of them in a log' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    expect(@ride1.rider_log).to be_a(Hash)
    expect(@visitor1.spending_money).to eq(8)
    expect(@visitor2.spending_money).to eq(4)
    expect(@ride1.revenue).to eq(3)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)
    expect(@visitor1.spending_money).to eq(8)
    expect(@visitor2.spending_money).to eq(4)
    expect(@visitor3.spending_money).to eq(13)
    expect(@ride3.rider_log).to be_a(Hash)
    expect(@ride3.revenue).to eq(2)
  end
end