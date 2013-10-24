// object to hold movement key information
inputs = new Object();
// add wasd inputs to object with a typ of movement
inputs[119] = { key: 'w', typ: 'movement', message: 'up' }
inputs[115] = { key: 's', typ: 'movement', message: 'down' }
inputs[97]  = { key: 'a', typ: 'movement', message: 'left' }
inputs[100] = { key: 'd', typ: 'movement', message: 'right' }

// jquery bindings listening for keypress events
$(function() {
  $( "body" ).keypress(function(event) {
    if(event.which in inputs) { // check for key in inputs object before proceeding
      var input = inputs[event.which]; // assign an input from our object
      console.log('user pressed: ' + input.key + ' for message: ' + input.message + ' of type: ' + input.typ);
      window.sendMessage(input.message, input.typ); // send a movement message to the server, of typ 'movement'
    }
  });
});