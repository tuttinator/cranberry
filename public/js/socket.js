window.socket = new WebSocket('ws://localhost:8080');

// Open the socket
socket.onopen = function(event) {

  console.log(event);
  
  // Send an initial message
  socket.send(JSON.stringify({message: 'Client here, I\'ve just connected!', handler: 'Log'}));
  
  // Listen for messages
  socket.onmessage = function(event) {
    parsed_message = JSON.parse(event.data);
    Cranberry.Handlers[parsed_message.handler](parsed_message.message);
  };
  
  // Listen for socket closes
  socket.onclose = function(event) {
    console.log('Client notified socket has closed', event);
  };
  
  // To close the socket....
  //socket.close()
};

window.sendMessage = function (message, handler) {
  if(Cranberry.socket_id === undefined) {
    alert('Cannot send any data to the server, handshake has failed.');
  } else {
    window.socket.send(JSON.stringify({ message: message, handler: handler, socket_id: Cranberry.socket_id }));
  }
};