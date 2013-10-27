module Cranberry
  module Models
    class Player
      attr_reader :socket_id, :socket
      attr_accessor :name
      
      def initialize(options = {})
        @socket_id, @socket = options[:socket_id], options[:socket]
        raise "Players require a socket id to be identifiable, and valid" unless @socket_id
        @name = options[:name] || "anonymous user"
      end

    end
  end
end