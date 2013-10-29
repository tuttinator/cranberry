module Cranberry
  module UI

    class Console
      def initialize(grid)
        @grid, @columns, @rows = grid, grid.columns, grid.rows
      end

      def draw
        print "\n"
        draw_border
        @rows.times.each_with_index do |row, row_index|
          print '|'
          @columns.times.each_with_index do |column, column_index|
            cell = @grid[row_index][column_index]
            if cell.nil?
              print ' '
            else
              print 'x'
            end
          end
          print '|'
          print "\n"
        end
        draw_border
      end

      def draw_border
        print '+'
        @columns.times.each { print '-' }
        print '+'
        print "\n"
      end

      def reset_cursor
        # http://stackoverflow.com/questions/14969458/deleting-multiple-lines-of-terminal-output-using-ruby
        # Where \r moves the cursor to the start of the line, \e[A moves the cursor up one line, and \e[K 
        # clears from the cursor position to the end of the line. If you don't need anything further down 
        # the screen, you can also just send \e[J once you have the cursor where you want; that clears 
        # all the way to the end of the screen.
        (@rows + 3).times { print "\e[A" }
      end
    end
  end
end