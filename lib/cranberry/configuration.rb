module Cranberry

  Configuration = Struct.new(:columns, :rows)

  def self.configuration
    @@configuration ||= Configuration.new(100, 100)
  end

end