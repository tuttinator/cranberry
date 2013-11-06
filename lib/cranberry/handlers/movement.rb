module Cranberry
  module Handlers
    class Movement

      def self.received_message(direction, socket_id)
        player = world.find_player(socket_id)
        grid.move(player, :"#{direction}")
        UI::Console.new(Models::World.instance.grid).draw
        puts "#{player.name} moved #{direction}"
      end

      def self.world
        Cranberry::Models::World.instance
      end

      def self.grid
        world.grid
      end

    end
  end
end