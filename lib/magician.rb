require 'trick'
require 'stringio'

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
