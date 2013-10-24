require 'json'

require './lib/server'
require './lib/cranberry/models/world'


Cranberry.run unless ENV["RUBY_ENV"] == 'test'
