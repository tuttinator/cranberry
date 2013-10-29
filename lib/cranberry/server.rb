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