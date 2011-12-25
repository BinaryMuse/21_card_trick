require 'minitest/spec'
require 'minitest/autorun'
require 'deck.rb'

describe Deck do
  describe "#constructor" do
    it "creates a full deck by default" do
      deck = Deck.new
      deck.cards.size.must_equal 52
    end

    it "creates a custom deck" do
      c1 = Card.new :ace, :spades
      c2 = Card.new 10, :hearts
      c3 = Card.new :jack, :diamonds
      deck = Deck.new [c1, c2, c3]
      deck.cards.size.must_equal 3
      deck.cards.must_include c1
      deck.cards.must_include c2
      deck.cards.must_include c3
    end
  end

  describe "#[]" do
    it "access the card at the given index" do
      deck = Deck.new
      deck[10].must_equal deck.cards[10]
    end
  end

  describe "#top" do
    describe "when there are cards left in the deck" do
      before do
        @deck = Deck.new
      end

      it "returns the top card" do
        @deck.top.must_equal @deck.cards[0]
      end
    end

    describe "when there are no cards left in the deck" do
      before do
        @deck = Deck.new []
      end

      it "returns the top card" do
        @deck.top.must_be_nil
      end
    end
  end

  describe "#shuffle!" do
    it "shuffles the cards" do
      deck = Deck.new
      deck.must_send [deck.cards, :shuffle!]
      deck.shuffle!
    end
  end

  describe "#pick" do
    describe "when there are enough cards in the deck" do
      before do
        @deck = Deck.new
      end

      it "returns the top x cards from the deck (removed from the deck)" do
        top_card = @deck.top
        deck2 = Deck.new @deck.pick(10)
        @deck.cards.size.must_equal 42
        deck2.cards.size.must_equal 10
        @deck.top.wont_equal top_card
        deck2.top.must_equal top_card
      end
    end

    describe "when there are not enough cards in the deck" do
      before do
        @deck = Deck.new([
          Card.new(10, :spades),
          Card.new(:ace, :diamonds),
          Card.new(2, :clubs)
        ])
      end

      it "throws an exception" do
        lambda {
          @deck.pick(4)
        }.must_raise(RuntimeError)
      end
    end
  end
end
