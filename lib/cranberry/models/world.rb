module Cranberry
  module Models
    class World

      def self.instance
        @instance ||= new
      end
      
      private_class_method :new, :allocate

    end
  end
end