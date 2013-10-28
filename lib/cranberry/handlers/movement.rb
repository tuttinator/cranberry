module Cranberry
  module Handlers
    class Movement

      def self.received_message(direction, socket_id)
        puts "#{socket_id} wants to move #{direction}"
      end

    end
  end
end