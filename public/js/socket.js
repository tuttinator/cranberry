window.socket = new WebSocket('ws://localhost:8080');

// Open the socket
socket.onopen = function(event) {
  
  // Send an initial message
  socket.send(JSON.stringify({'message': 'I am the client and I\'m listening!', type: 'log'}));
  
  // Listen for messages
  socket.onmessage = function(event) {
    console.log('Client received a message', event);
  };
  
  // Listen for socket closes
  socket.onclose = function(event) {
    console.log('Client notified socket has closed', event);
  };
  
  // To close the socket....
  //socket.close()
};

window.sendMessage = function (message, type) {
  window.socket.send(JSON.stringify({ 'message': message, 'type': type }));
};