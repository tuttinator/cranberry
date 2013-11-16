require 'spec_helper'

describe 'the command line interface' do

  it 'should boot' do
    expect(Cranberry.run).to_not raise_error
    Cranberry.stop
  end

end
