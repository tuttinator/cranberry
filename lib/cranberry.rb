# Gem dependencies
require 'bundler/setup'
Bundler.setup
require 'eventmachine'
require 'em-websocket'
require 'json'
require 'paint'

# Require all files in the Cranberry folder
Dir[File.dirname(__FILE__) + '/cranberry/**/*.rb'].each do |file|
  require file
end

# Main entrypoint
module Cranberry
  def self.run
    EventMachine.run do
      trap("TERM") { self.stop }
      trap("INT")  { self.stop }
      WebSocketServer.start
    end
  end

  def self.stop
    UI.clear_terminal_screen
    UI.display_termination_message
    EventMachine.stop
  end
end