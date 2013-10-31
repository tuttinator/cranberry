require 'spec_helper'

describe Cranberry::Models::Grid do

  before :each do
    @rows = 10
    @columns = 10
    @grid = Cranberry::Models::Grid.new(@rows, @columns)
  end

  it 'delegates to an array' do
    expect(@grid.count).to eq(@rows)
  end

  # NOTE: the trade off is that the original array
  # subscript method is no longer available
  it 'has a subscript convenience operator' do
    # Get the inner grid variable and set that
    @grid.instance_variable_get(:@grid)[3][6] = "x"
    expect(@grid[3, 6]).to eq("x")
  end

  it 'places things on the grid' do
    @grid.place "x"
    expect(@grid.flatten.compact).to eq(["x"])
  end

end