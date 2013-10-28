module Cranberry
  def self.banner
    <<-EOF
                                                                                           
   _|_|_|                                _|                                                
 _|        _|  _|_|    _|_|_|  _|_|_|    _|_|_|      _|_|    _|  _|_|  _|  _|_|  _|    _|  
 _|        _|_|      _|    _|  _|    _|  _|    _|  _|_|_|_|  _|_|      _|_|      _|    _|  
 _|        _|        _|    _|  _|    _|  _|    _|  _|        _|        _|        _|    _|  
   _|_|_|  _|          _|_|_|  _|    _|  _|_|_|      _|_|_|  _|        _|          _|_|_|  
                                                                                       _|  
                                                                                   _|_|    
    EOF
  end

  def self.display_welcome_message
    puts Paint[self.banner, :red]
    puts "-" * 90
    puts "Cranberry Game Server listening for WebSockets on #{Cranberry.configuration[:port]}"
    puts "-" * 90
    print "\n\n"
  end

  def self.display_termination_message
    print "\n"
    puts "-" * 90
    puts "Terminating WebSocket Server"
    puts "-" * 90
  end

  def self.clear_terminal_screen
    puts "\e[H\e[2J" # this may not be very cross-platform...
  end

end