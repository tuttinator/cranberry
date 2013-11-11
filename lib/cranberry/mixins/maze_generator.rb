module Cranberry
  module Mixins
    module MazeGenerator
      DIRECTIONS = [ [1, 0], [-1, 0], [0, 1], [0, -1] ]
     
      def setup_maze(options = {})

        @columns   ||= options[:columns]
        @rows      ||= options[:rows]
        @start_x     = rand(@columns)
        @start_y     = 0
        @end_x       = rand(@columns)
        @end_y       = @rows - 1
     
        # Which walls do exist? Default to "true". Both arrays are
        # one element bigger than they need to be. For example, the
        # @vertical_walls[x][y] is true if there is a wall between
        # (x,y) and (x+1,y). The additional entry makes printing easier.
        @vertical_walls   = Array.new(columns) { Array.new(rows, true) }
        @horizontal_walls = Array.new(columns) { Array.new(rows, true) }
        # Path for the solved maze.
        @path             = Array.new(columns) { Array.new(rows) }
     
        # "Hack" to print the exit.
        @horizontal_walls[@end_x][@end_y] = false
     
        # Generate the maze.
        generate_maze
      end
     
      # Print a nice ASCII maze.
      def print_maze
        # Special handling: print the top line.
        puts @columns.times.inject("+") {|str, x| str << (x == @start_x ? "   +" : "---+")}
     
        # For each cell, print the right and bottom wall, if it exists.
        @rows.times do |y|
          line = @columns.times.inject("|") do |str, x|
            str << (@path[x][y] ? " * " : "   ") << (@vertical_walls[x][y] ? "|" : " ")
          end
          puts line
     
          puts @columns.times.inject("+") {|str, x| str << (@horizontal_walls[x][y] ? "---+" : "   +")}
        end
      end
     
      private
     
      # Reset the VISITED state of all cells.
      def reset_visiting_state
        @visited = Array.new(@columns) { Array.new(@rows) }
      end
     
      # Is the given coordinate valid and the cell not yet visited?
      def move_valid?(x, y)
        (0...@columns).cover?(x) && (0...@rows).cover?(y) && !@visited[x][y]
      end
     
      # Generate the maze.
      def generate_maze

        reset_visiting_state
        generate_visit_cell(@start_x, @start_y)
      end
     
      # Depth-first maze generation.
      def generate_visit_cell(x, y)
        # Mark cell as visited.
        @visited[x][y] = true
     
        # Randomly get coordinates of surrounding cells (may be outside
        # of the maze range, will be sorted out later).
        coordinates = DIRECTIONS.shuffle.map { |dx, dy| [x + dx, y + dy] }
     
        for new_x, new_y in coordinates
          next unless move_valid?(new_x, new_y)
     
          # Recurse if it was possible to connect the current and
          # the cell (this recursion is the "depth-first" part).
          connect_cells(x, y, new_x, new_y)
          generate_visit_cell(new_x, new_y)
        end
      end
     
      # Try to connect two cells. Returns whether it was valid to do so.
      def connect_cells(x1, y1, x2, y2)
        if x1 == x2
          # Cells must be above each other, remove a horizontal wall.
          @horizontal_walls[x1][ [y1, y2].min ] = false
        else
          # Cells must be next to each other, remove a vertical wall.
          @vertical_walls[ [x1, x2].min ][y1] = false
        end
      end
    end
  end
end