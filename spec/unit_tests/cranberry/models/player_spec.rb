require 'spec_helper'

describe Cranberry::Models::Player do

  let(:player) { Cranberry::Models::Player.new({ socket_id: 'blah', socket: 'replace with websocket object' }) }

  it "starts with the name 'anonymous user'" do
    expect(player.name).to eq('anonymous user')
  end

end