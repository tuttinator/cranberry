# Gem dependencies
require 'bundler/setup'
Bundler.setup
require 'eventmachine'
require 'em-websocket'
require 'json'
require 'paint'

# Cranberry files
Dir[File.dirname(__FILE__) + '/cranberry/**/*.rb'].each do |file|
  require file
end

