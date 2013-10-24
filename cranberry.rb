require 'json'
require 'paint'

require './lib/server'
require './lib/cranberry/banner'
require './lib/cranberry/models/world'


Cranberry.run unless ENV["RUBY_ENV"] == 'test'
