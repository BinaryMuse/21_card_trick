$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'magician'
require 'trick'
require 'deck'

# Pick 21 random cards from a deck and set up the trick
cards = Deck.new.shuffle!.pick(21)
trick = Trick.new Deck.new(cards)
# Every trick needs a magician to perform it
magician = Magician.new
magician.perform trick
