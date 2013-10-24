window.sendMessage = function (message, type) {
  window.socket.send(JSON.stringify({ 'message': message, 'type': type }));
};