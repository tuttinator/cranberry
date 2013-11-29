module Cranberry
  module WebSocketServer
    def self.start

      console_ui = UI::Console.new(Models::Universe.instance.grid)
      UI.display_welcome_message
      console_ui.draw

      EventMachine::WebSocket.run(host: Cranberry.configuration[:host], port: Cranberry.configuration[:port]) do |ws|
        
        ws.onopen do |handshake|
          world = Cranberry::Models::Universe.instance
          player = Cranberry::Models::Player.new(socket_id: handshake.headers["Sec-WebSocket-Key"], socket: ws)
          ws.send({ handler: 'Handshake', message: player.socket_id }.to_json)
          world.grid.place player
          world.players << player

          console_ui.reset_cursor
          console_ui.draw

        end

        ws.onmessage do |message|
          Cranberry.route_message message
        end

        ws.onclose do
          world = Cranberry::Models::Universe.instance
          player = world.players.detect {|a| a.socket.signature == ws.signature}
          world.players.delete player
        end
      end


    end
  end
end