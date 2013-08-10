require 'rubygems'
require 'bundler'

Bundler.require(:default)
require './app'

use Assets

run App

