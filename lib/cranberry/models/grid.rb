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
        if @grid.respond_to? method_name
          @grid.public_send method_name.to_sym, *arg, &block
        else
          super
        end
      end

    end
  end
end