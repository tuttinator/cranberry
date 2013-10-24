# Gem dependencies
require 'bundler'
Bundler.require

require './lib/cranberry/banner'
require './lib/cranberry/configuration'
require './lib/cranberry/models/world'
require './lib/cranberry/models/player'
require './lib/cranberry/websocket_server'
require './lib/server'

Cranberry.run unless ENV["RUBY_ENV"] == 'test'
