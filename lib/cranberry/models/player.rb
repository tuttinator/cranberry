module Cranberry
  module Models
    class Player
      attr_accessor :name
      
      def initialize(options = {})
        @name = options[:name] || "anonymous user"
      end

    end
  end
end