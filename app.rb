require 'bundler'
Bundler.require

# $:.unshift File.expand_path("./../lib", __FILE__)
# require_relative 'lib/test/'

require_relative './lib/'

Application.new.perform