module Cranberry
  module Models
    class Maze < Grid
      include Cranberry::Mixins::MazeGenerator

      def initialize(*args)
        super(*args)
        setup_maze
      end
      
    end
  end
end