# Gem dependencies
require 'bundler/setup'
Bundler.setup
require 'eventmachine'
require 'em-websocket'
require 'json'
require 'paint'

# Cranberry files
require 'cranberry/version'
require 'cranberry/banner'
require 'cranberry/configuration'
# TODO load all .rb files in handler and model dirs
require 'cranberry/handlers/log'
require 'cranberry/handlers/movement'
require 'cranberry/models/world'
require 'cranberry/models/grid'
require 'cranberry/models/player'
require 'cranberry/ui/console'
require 'cranberry/websocket_server'
require 'cranberry/server'
require 'cranberry/router'
