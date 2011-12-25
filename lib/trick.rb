require 'stringio'
require 'deck'

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

class Magician
  def perform(trick)
    @trick = trick

    @trick.choose_column! ask_user_for_column("Pick a card and enter the column number it is in: ")
    @trick.choose_column! ask_user_for_column("Find your card and enter the column number it is in: ")
    @trick.choose_column! ask_user_for_column("Once more, find your card and enter the column number it is in: ")
    puts
    puts "Your card is #{@trick.deck[10].to_s}."
  end

  def ask_user_for_column(prompt)
    show_cards
    while true
      print prompt
      input = $stdin.gets.strip
      if input.match /^[123]$/
        return input.to_i - 1 # User inputs 1, 2, or 3 but we want 0, 1, or 2
      else
        puts "Invalid column number."
      end
    end
  end

  def show_cards
    puts
    puts layout_deck(@trick.deck)
    puts
  end

  def layout_deck(deck)
    buffer = StringIO.new
    buffer << "   1    2    3\n"
    deck.cards.each_with_index do |card, index|
      if Trick.indexes_for_column(0).include? index
        buffer << "["
      end
      buffer << " %3s " % card.to_s
      if Trick.indexes_for_column(2).include? index
        buffer << "]\n"
      end
    end
    buffer.string
  end
end
