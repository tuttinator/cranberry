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

      def place(thing)
        x = rand(@columns)
        y = rand(@rows)
        if @grid[y][x]
          place(thing)
        else
          @grid[y][x] = thing
        end
      end

      def find(thing)
        rows.times.each do |row|
          columns.times.each do |column|
            return { row: row,  column: column } if thing == self[row, column]
          end
        end
      end

      def move(thing, direction)
        from = find(thing)
        y, x = from[:row], from[:column]
        @grid[y][x] = nil
        case direction
        when :up
          to = { row: from[:row] - 1, column: from[:column] }
        when :down
          to = { row: from[:row] + 1, column: from[:column] }
        when :left
          to = { row: from[:row], column: from[:column] - 1 }
        when :right
          to = { row: from[:row], column: from[:column] + 1 }
        else
          raise 'Invalid direction'
        end
        # TODO move location tidyup somewhere else
        to[:row] = 0 if to[:row] < 0
        to[:column] = 0 if to[:column] < 0
        to[:row] = @rows if to[:row] >= @rows
        to[:column] = @columns if to[:column] >= @columns
        # TODO ensure no other players/obstacles are in this location
        y, x = to[:row], to[:column]
        begin
          @grid[y][x] = thing
        rescue Exception => e
          raise "Error with row: #{y} (#{@rows} rows) col: #{x} (#{@columns} cols), exception: #{e}"
        end
      end

    end
  end
end