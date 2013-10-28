module Cranberry
  module Handlers
    class Log

      def self.received_message(message, socket_id)
        puts "#{message}"
      end

    end
  end
end