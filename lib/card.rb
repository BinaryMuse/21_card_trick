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
