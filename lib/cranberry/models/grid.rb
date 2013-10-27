module Cranberry
  module Models
    class Grid
      attr_reader :rows, :columns

      def initialize(rows, columns)
        @rows, @columns = rows, columns
        @grid = Array.new(rows) do 
          Array.new(columns)
        end
      end

      def method_missing(method_name, *args, &block)
        @grid.send method_name, *args, &block
      end

    end
  end
end