module Cranberry
  module Models
    class Universe
      attr_accessor :players
      attr_reader :grid

      # Singleton instance
      def self.instance
        @instance ||= new
      end
      
      private_class_method :new

      def find_player(socket_id)
        players.each { |player| return player if player.socket_id == socket_id }
      end

      private

      def initialize
        # Players exist on connection
        @players = []
        # The grid is a matrix - an array of arrays
        @grid = Grid.new(Cranberry.configuration[:rows], Cranberry.configuration[:columns])
      end

    end
  end
end