Cranberry Websocket Game Server
===============================
                                                                                           
       _|_|_|                                _|                                                
     _|        _|  _|_|    _|_|_|  _|_|_|    _|_|_|      _|_|    _|  _|_|  _|  _|_|  _|    _|  
     _|        _|_|      _|    _|  _|    _|  _|    _|  _|_|_|_|  _|_|      _|_|      _|    _|  
     _|        _|        _|    _|  _|    _|  _|    _|  _|        _|        _|        _|    _|  
       _|_|_|  _|          _|_|_|  _|    _|  _|_|_|      _|_|_|  _|        _|          _|_|_|  
                                                                                           _|  
                                                                                       _|_|    

Cranberry is a WebSocket EventMachine-based server, that takes JSON strings as instructions.

This is not production ready, and still a work in progress. Check back soon!

## Installation

Add this line to your application's Gemfile:

    gem 'cranberry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cranberry

## Usage

To use run:

    bin/cranberry


to use the front-end client-side interface, open ``public/index.html``

## Concepts

### Universe

All games have at least one 'world'. There may be multiple kinds of gameworld in the future, but this current implementation is of a world with a grid of cells.

### The grid

The grid has a width and height, and contains a set of cells. Each cell can have up to three walls, but not four - as four walls would make it inaccessible.

Walls are procedurally generated on initialisation, but they don't have to be immutable, and stored as edges within the Grid class singleton instance with 

Players move between cells, but cannot move through a wall. A player's X, Y co-ordinate position will be within a discrete cell at all times.

### Cells

Cells are implemented with an awareness of their up to 8 neighbours - North, North-East, East, South-East, South, South-West, West, North-West (when described in a clock-wise direction). The cell is the context of the Player's (or any game object's) position, and will respond to the logic of where the player is allowed to move.

e.g. ``#can_move?(:north) # => true or false``

## Roadmap

0.0.1 stable

- [ ] build up spec coverage
- [ ] implement a command router for the Websocket onmessage events
- [ ] experiment with a DSL for other projects to use the gem with


1.0.0

- [ ] make it awesome

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
