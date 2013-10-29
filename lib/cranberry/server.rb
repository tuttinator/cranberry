module Cranberry

  def self.run

    count = 0

    EventMachine.run do

      trap("TERM") { self.stop }
      trap("INT")  { self.stop }

      WebSocketServer.start

      console_ui = UI::Console.new(Models::World.instance.grid)
      UI.display_welcome_message
      console_ui.draw
      console_ui.reset_cursor
      console_ui.draw

    end
  end

  def self.stop
    UI.clear_terminal_screen
    UI.display_termination_message
    EventMachine.stop
  end

end