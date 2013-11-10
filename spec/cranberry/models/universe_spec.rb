require 'spec_helper'

describe Cranberry::Models::Universe do

  it "is a singleton instance" do
    world1, world2 = Cranberry::Models::Universe.instance, Cranberry::Models::Universe.instance
    expect(world1.object_id).to eq(world2.object_id)
  end

  describe "it has a list of players" do

    before :each do
      @world = Cranberry::Models::Universe.instance
    end

    it "is an array" do
      expect(@world.players).to be_a Array
    end

  end

  describe "it has a grid" do

    before :each do
      @grid = Cranberry::Models::Universe.instance.grid
    end

    it "has a grid" do
      expect(@grid).to be_a Cranberry::Models::Grid
    end

  end

end