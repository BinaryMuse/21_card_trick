class Card
  attr_accessor :face, :suit

  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  SUITS = [:hearts, :diamonds, :spades, :clubs]

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def to_s
    face = if @face.is_a? Fixnum
      @face.to_s
    else
      @face.to_s[0].chr.upcase
    end

    suit = case @suit
    when :hearts
      "h"
    when :diamonds
      "d"
    when :spades
      "s"
    when :clubs
      "c"
    end

    "#{face}#{suit}"
  end
end

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
