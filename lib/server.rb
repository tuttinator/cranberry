require 'websocket-eventmachine-server'

module Cranberry

  PORT = ENV['cranberry-port'] || 8080

  def run
    EM.run do

      WebSocket::EventMachine::Server.start(host: "0.0.0.0", port: PORT) do |ws|
        ws.onopen do
          puts "Client connected"
          ws.send "Welcome, "
        end

        ws.onmessage do |message, type|
          puts "Received message: #{message} | of type #{type}"
          parsed_message = JSON.parse(message)
          ws.send message, type: type
        end

        ws.onclose do
          puts "Client disconnected"
        end
      end

    end
  end

end

if $PROGRAM_NAME == __FILE__
  Cranberry.run
end