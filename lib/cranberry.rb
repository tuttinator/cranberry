# Gem dependencies
require 'bundler/setup'
Bundler.setup
require 'eventmachine'
require 'em-websocket'
require 'json'
require 'paint'
# ruby standard library
require 'curses'

# Require all files in the Cranberry folder
Dir[File.dirname(__FILE__) + '/cranberry/**/*.rb'].each do |file|
  require file
end

# Main entrypoint
module Cranberry
  def self.run
    game_server = Cranberry::GameServer.new
    game_server.run
  end

end