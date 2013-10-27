module Cranberry

  def self.run

    count = 0

    EventMachine.run do

      trap("TERM") { self.stop }
      trap("INT")  { self.stop }

      WebSocketServer.start

      display_welcome_message

    end
  end

  def self.stop
    display_termination_message
    EventMachine.stop
  end

end