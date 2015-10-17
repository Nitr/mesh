ENV['RACK_ENV'] ||= 'development'
env = ENV['RACK_ENV']
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, env

DB = Sequel.connect('postgres://postgres@postgres/mesh')
DB.extension :pg_array, :pg_json

require 'models/environment'
require 'models/template'
require 'entities'
require 'api'
