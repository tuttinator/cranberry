module Cranberry

  Configuration = Struct.new(:columns, :rows, :host, :port)

  def self.configuration
    @@configuration ||= Configuration.new(88, 20, "0.0.0.0", 8080)
  end

end