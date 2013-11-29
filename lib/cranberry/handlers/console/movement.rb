module Cranberry
  module Handlers
    module Console
      class Movement
        def keypress
          case Curses.getch
          when Curses::Key::UP
            world.grid.move(player, :up)
          when Curses::Key::DOWN
            world.grid.move(player, :down)
          when Curses::Key::LEFT
            world.grid.move(player, :left)
          when Curses::Key::RIGHT
            world.grid.move(player, :right)
          end
        end
      end
    end
  end
end