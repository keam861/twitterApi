# Hace require de los gems necesarios.
# Revisa: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'twitter'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')

#The Twitter Ruby Gem Configuration
CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = "I7PPB6NSIE4laUiZIW6NkTZy3"
  config.consumer_secret     = "3Cx2uJkYelE5OMomHJUWBbqoL8p558C2GouIq2RYVaOskA36Zi"
  config.access_token        = "2409996168-zVCQwRrQ2IMaeHd1SagoSQudIa6O8jEqNp3V5gM"
  config.access_token_secret = "0ysNy9pptuPySe5gLqPMxwv8w4IGhSawABuNwvkJHyPPW"
end
