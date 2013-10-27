module Cranberry
  module WebSocketServer
    def self.start
      EventMachine::WebSocket.run(host: Cranberry.configuration[:host], port: Cranberry.configuration[:port]) do |ws|
        ws.onopen do |handshake|

          world = Cranberry::Models::World.instance
          player = Cranberry::Models::Player.new(socket_id: handshake.headers["Sec-WebSocket-Key"], socket: ws)
          world.players << player

          puts "A new client connected (socket_id: #{player.socket_id})"
          ws.send "Welcome"
        end

        ws.onmessage do |message|
          puts "Received message: #{message}"
          parsed_message = begin
             JSON.parse message
          rescue JSON::ParserError
            { message: message }
          end

          # ws.send message, type: type
        end

        ws.onclose do

          world = Cranberry::Models::World.instance
          player = world.players.detect {|a| a.socket.signature == ws.signature}
          puts "Client #{player.socket_id} disconnected"
          world.players.delete player
        end
      end

    end
  end
end