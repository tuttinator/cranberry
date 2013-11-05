module Cranberry
  class GameServer
    attr_accessor :ui

    def initialize
      init_plugins
    end

    def init_plugins
      @plugins = []
      ::Cranberry::Plugins.constants.each do |name|
        @plugins << ::Cranberry::Plugins.const_get(name).new(self)
      end
    end

    def run
      EventMachine.run do
        trap("TERM") { self.stop }
        trap("INT")  { self.stop }
        WebSocketServer.start
      end
    end

    def stop
      UI.display_termination_message
      EventMachine.stop
    end
  end
end