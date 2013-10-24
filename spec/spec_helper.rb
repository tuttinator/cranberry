# require_relative '../cranberry'
require_relative '../lib/cranberry/models/world'
require 'rspec'
require 'rspec/autorun'

ENV['cranberry-port'] = 9999

Dir[File.join(__FILE__, "support/*.rb")].each {|f| require f }

RSpec.configure do |config|

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

end