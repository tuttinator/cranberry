// TODO move init stuff like this to a global file
window.Cranberry = new Object();
Cranberry.Handlers = new Object();

Cranberry.Handlers.Handshake = function (socket_id) {
  window.Cranberry.socket_id = socket_id;
};