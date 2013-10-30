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

      # TODO: take a splat and count the args length
      # and use that to determine whether to access
      # just the inner array, or a co-ordinate of both
      def [](a, b)
        @grid[a][b]
      end

      def place(player)
        x = rand(@columns)
        y = rand(@rows)
        if @grid[y][x]
          place(player)
        else
          @grid[y][x] = player
        end
      end

    end
  end
end