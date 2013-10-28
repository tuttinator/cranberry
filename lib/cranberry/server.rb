module Cranberry

  def self.run

    count = 0

    EventMachine.run do

      trap("TERM") { self.stop }
      trap("INT")  { self.stop }

      WebSocketServer.start

      display_welcome_message

      console_ui = UI::Console.new(Models::World.instance.grid)

      console_ui.draw
      console_ui.reset_cursor
      console_ui.draw

    end
  end

  def self.stop
    clear_terminal_screen
    display_termination_message
    EventMachine.stop
  end

end