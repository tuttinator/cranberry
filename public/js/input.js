// object to hold movement key information
inputs = new Object();
// add wasd inputs to object with a handler of movement
inputs[119] = { key: 'w', handler: 'Movement', message: 'up' }
inputs[115] = { key: 's', handler: 'Movement', message: 'down' }
inputs[97]  = { key: 'a', handler: 'Movement', message: 'left' }
inputs[100] = { key: 'd', handler: 'Movement', message: 'right' }

// jquery bindings listening for keypress events
$(function() {
  $( "body" ).keypress(function(event) {
    if(event.which in inputs) { // check for key in inputs object before proceeding
      var input = inputs[event.which]; // assign an input from our object
      window.sendMessage(input.message, input.handler); // send a movement message to the server, of handler 'movement'
    }
  });
});