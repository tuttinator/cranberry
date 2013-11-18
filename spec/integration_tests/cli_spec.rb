require 'spec_helper'

describe 'the command line interface' do

  it 'should boot' do
    expect do
      Thread.new do
        Cranberry.run
      end
    end.to_not raise_error
  end

end
