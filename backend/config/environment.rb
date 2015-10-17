ENV['RACK_ENV'] ||= 'development'
env = ENV['RACK_ENV']
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, env

Mongoid.load!( File.join(File.dirname(__FILE__), "mongoid.#{env}.yml"), env.to_sym)

require 'models/environment'
require 'models/mail_settings'
require 'models/param'
require 'models/template'
