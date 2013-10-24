require 'spec_helper'

describe Cranberry::Models::World do

  it "is a singleton instance" do
    world1, world2 = Cranberry::Models::World.instance, Cranberry::Models::World.instance
    expect {world1.object_id}.to eq(world2.object_id)
  end

end