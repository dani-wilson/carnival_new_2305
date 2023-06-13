require 'pry'
require 'visitor'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists and has attributes' do
    expect(@visitor1).to be_a(Visitor)
    expect(@visitor1.name).to eq("Bruce")
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq(10)
  end

  it 'starts out with no preferences' do
    expect(@visitor1.preferences).to eq([])
  end

  it 'can add a preference' do
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)
    expect(@visitor1.preferences).to eq([:gentle, :thrilling])
  end

  it 'will tell visitors if they are tall enough for the ride' do
    expect(@visitor1.tall_enough?(54)).to be(true)
    expect(@visitor2.tall_enough?(54)).to be(false)
    expect(@visitor1.tall_enough?(54)).to be(true)
    expect(@visitor1.tall_enough?(64)).to be(false)
  end
end