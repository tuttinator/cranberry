module Cranberry
  module Models
    class World
      attr_accessor :players
      attr_reader :grid

      # Singleton instance
      def self.instance
        @instance ||= new
      end
      
      private_class_method :new

      private

      def initialize
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