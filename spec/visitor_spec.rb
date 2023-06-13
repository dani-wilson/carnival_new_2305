require 'pry'
require 'visitor'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  it 'exists and has attributes' do
    expect(@visitor1).to be_a(Visitor)
    expect(@visitor1.name).to eq("Bruce")
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq("$10")
  end

  it 'starts out with no preferences' do
    expect(@visitor1.preferences).to eq([])
  end
end