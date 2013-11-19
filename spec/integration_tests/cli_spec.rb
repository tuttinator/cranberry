require 'spec_helper'

describe 'the command line interface' do

  it 'boot' do
    expect do
      Thread.new do
        Cranberry.run
      end
    end.to_not raise_error
  end

  it 'listens for websocket connections'

end
