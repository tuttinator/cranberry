module Cranberry
  module Models
    class World
      attr_reader :grid

      def self.instance
        @instance ||= new
      end
      
      private

      def new
        @grid = Array.new(Cranberry.configuration[:rows]) do 
          Array.new(Cranberry.configuration[:columns])
        end
      end

    end
  end
end