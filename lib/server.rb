require 'websocket-eventmachine-server'

module Cranberry

  PORT = ENV['cranberry-port'] || 8080

  def self.run
    EM.run do

      trap("TERM") { self.stop }
      trap("INT")  { self.stop }

      WebSocket::EventMachine::Server.start(host: "0.0.0.0", port: PORT) do |ws|
        ws.onopen do
          # puts message.inspect # my server wouldn't start with this line uncommented -giles
          puts "Client connected"
          ws.send "Welcome"
        end

        ws.onmessage do |message, type|
          puts "Received message: #{message} | of type #{type}"
          parsed_message = begin
             JSON.parse message
          rescue JSON::ParserError
            { message: message }
          end
          # ws.send message, type: type
        end

        ws.onclose do
          puts "Client disconnected"
        end

      end

      puts Paint[self.banner, :red]
      puts "-" * 90
      puts "Cranberry Game Server listening for WebSockets on #{PORT}"
      puts "-" * 90
      print "\n\n"

      def self.stop
        print "\n"
        puts "-" * 90
        puts "Terminating WebSocket Server"
        puts "-" * 90
        EventMachine.stop
      end

    end
  end

end