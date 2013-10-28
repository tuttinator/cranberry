module Cranberry

  # 
  # Cranberry expects message handlers to be defined within the cranberry/handlers directory
  # 

  def self.route_message(message)
    parsed_message = begin
       JSON.parse message
    rescue JSON::ParserError
      { message: message, handler: 'Log' }
    end
    Object.const_get("Cranberry::Handlers::#{parsed_message['handler']}").received_message(parsed_message['message'], parsed_message['socket_id'])
  end

end