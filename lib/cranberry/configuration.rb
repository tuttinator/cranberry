module Cranberry

  Configuration = Struct.new(:columns, :rows, :host, :port)

  def self.configuration
    @@configuration ||= Configuration.new(100, 30, "0.0.0.0", 8080)
  end

end