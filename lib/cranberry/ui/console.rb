module Cranberry
  module UI
    class Console
      def initialize(grid)
        @columns, @rows = grid.columns, grid.rows
      end

      def draw
        draw_borders
        @rows.times.each do |row|
          print '|'
          @columns.times.each do |column|
            print ' '
          end
          print '|'
          print "\n"
        end
        draw_borders
      end

      def draw_borders
        print '+'
        @columns.times.each { print '-' }
        print '+'
        print "\n"
      end

      def reset_cursor
        (@rows + 2).times { print "\r" }
      end
    end
  end
end