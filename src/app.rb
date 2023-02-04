#!/usr/bin/env ruby
require_relative './menu'

def main
  puts 'Welcome to my school library'
  app = App.new
  app.main
end
main
