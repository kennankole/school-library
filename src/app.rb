#!/usr/bin/env ruby
require './menu'

def main
  puts 'Welcome to my school library'
  app = App.new
  app.menu
end
main
