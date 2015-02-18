require 'rspec/expectations'
require 'byebug'
require 'date'
require File.expand_path('../pre_loader', __FILE__)
include PreLoader
require_relative  '../media_mobile/media_mobile'

# Enable using plain MiniTest assertions instead of quasi-english shoulda
require 'test/unit/assertions'
World Test::Unit::Assertions