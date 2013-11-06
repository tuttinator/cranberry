require 'spec_helper'

describe Cranberry::Models::Player do

  let(:player) {Player.new}

  it "starts with the name 'anonymous user'" do
    expect(player.name).to eq('anonymous user')
  end

end