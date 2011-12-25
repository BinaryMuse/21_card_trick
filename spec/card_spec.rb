require 'minitest/spec'
require 'minitest/autorun'
require 'card.rb'

describe Card do
  describe "#constructor" do
    it "assigns correct attributes" do
      card = Card.new 7, :hearts
      card.face.must_equal 7
      card.suit.must_equal :hearts
    end
  end

  describe "#to_s" do
    it "returns the correct string representation of a card" do
      Card.new(7, :hearts).to_s.must_equal "7h"
      Card.new(:ace, :spades).to_s.must_equal "As"
      Card.new(:jack, :clubs).to_s.must_equal "Jc"
      Card.new(10, :diamonds).to_s.must_equal "10d"
    end
  end
end
