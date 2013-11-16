## Design Goals

The Cranberry gem is designed to be a framework for real-time 
multiplayer HTML5 games.

Through extraction from game examples, it aims to create a DSL 
and toolchain which is enjoyable to use.

### About

Cranberry has a few moving parts that work in parallel, and is
currently very much a work in progress.

It is designed to be an EventMachine-based Websockets server with
server-side game state held in memory. The client-side
JavaScript framework connects to the websocket server.

### Websocket server

The EventMachine loop will respond to requests for a websocket
connection and send a handshake. At this point an anonymous player
instance is created and placed on the grid.

Commands can be sent encoded in JSON over the socket connection to set
the user's name, or send direction keys to move the player.
