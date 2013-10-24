require 'websocket-eventmachine-server'

port = ENV['cranberry-port'] || 8080

EM.run do

  WebSocket::EventMachine::Server.start(host: "0.0.0.0", port: port) do |ws|
    ws.onopen do
      puts "Client connected"
      ws.send "Welcome, "
    end

    ws.onmessage do |msg, type|
      puts "Received message: #{msg} | of type #{type}"
      ws.send msg, type: type
    end

    ws.onclose do
      puts "Client disconnected"
    end
  end

end