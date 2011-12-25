class Trick
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def choose_column!(col)
    cols = case col
    when 0
      [1, 0, 2]
    when 1
      [0, 1, 2]
    when 2
      [0, 2, 1]
    end

    new_cards = cols.map { |n| cards_in_column(n) }.flatten
    @deck.cards = new_cards
  end

  def cards_in_column(col)
    Trick.indexes_for_column(col).map { |i| @deck.cards[i] }
  end

  def self.indexes_for_column(col)
    (0..20).to_a.select { |n| n % 3 == col }
  end
end
