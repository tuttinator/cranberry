var socket = new WebSocket('ws://localhost:8080');



// Open the socket
socket.onopen = function(event) {
  
  // Send an initial message
  socket.send(JSON.stringify({'message': 'I am the client and I\'m listening!'}));
  
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

$(function() {
  $( "body" ).keypress(function( event ) {
    var keys = [];
    keys['119'] = 'w';
    keys['97'] = ''
    var keys = new Obj;
    keys[97]= 'w';
    // keys
    // { 97: 'w' }
    switch(event.which){
      case 119: // w
        keyPressed = 'w';
        break;
      case 97: // a
        keyPressed = 'a';
        break;
      case 115: // s
        keyPressed = 's';
        break;
      case 100: // d
        keyPressed = 'd';
        break;
    }
    console.log(keyPressed);
  });
});