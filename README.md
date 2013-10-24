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

## Roadmap

0.0.1 stable

[ ] build up spec coverage

[ ] implement a command router for the Websocket onmessage events

[ ] experiment with a DSL for other projects to use the gem with


1.0.0

[ ] make it awesome

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
