require 'card'

class Deck
  attr_accessor :cards

  def initialize(cards = nil)
    if cards
      @cards = cards
    else
      @cards = []
      Card::FACES.each do |face|
        Card::SUITS.each do |suit|
          card = Card.new face, suit
          @cards << card
        end
      end
    end
  end

  def [](index)
    @cards[index]
  end

  def top
    if @cards.length > 0
      @cards[0]
    else
      nil
    end
  end

  def shuffle!
    @cards.shuffle!
    self
  end

  def pick(num = 1)
    if @cards.size >= num
      @cards.shift num
    else
      raise "Not enough cards to pick #{num} of them."
    end
  end
end
