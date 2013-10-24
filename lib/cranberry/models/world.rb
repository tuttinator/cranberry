module Cranberry
  module Models
    class World
      attr_reader :grid
      attr_accessor :players

      # Singleton instance
      def self.instance
        @instance ||= new
      end
      
      private

      def new
        # Players exist on connection
        @players = []
        # The grid is a matrix - an array of arrays
        @grid = Array.new(Cranberry.configuration[:rows]) do 
          Array.new(Cranberry.configuration[:columns])
        end
      end

    end
  end
end