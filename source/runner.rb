require_relative 'game'
require_relative 'card'
require_relative 'view'
require_relative 'controller'

  if ARGV[0] == "begin"
    ruby controller.rb
  end