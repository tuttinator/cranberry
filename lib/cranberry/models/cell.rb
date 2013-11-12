module Cranberry
  module Models
    class Cell
      attr_accessor :contents

      # belongs_to the grid
      def initialize(options)
        @row, @column = options[:row], options[:column]
        # Include a reference to the grid for the Cell
        # instance to know about it's neighbours
        @grid = options[:grid]
        @contents = nil
      end

      # Neighbours
      # NW  N  NE
      # W   x   E
      # SW  S  SE
      def neighbours
        { 
          north_west:  @grid[@row - 1, @column - 1],
          north:       @grid[@row - 1, @column], 
          north_east:  @grid[@row - 1, @column + 1],
          east:        @grid[@row,     @column + 1],
          south_east:  @grid[@row + 1, @column + 1],
          south:       @grid[@row + 1, @column],
          south_west:  @grid[@row + 1, @column - 1],
          west:        @grid[@row,     @column - 1],
        }
      end

    end
  end
end