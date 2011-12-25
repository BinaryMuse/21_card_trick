require 'minitest/spec'
require 'minitest/autorun'
require 'trick.rb'

describe Trick do
  before do
    @trick = Trick.new Deck.new((1..21).to_a)
  end

  describe "#choose_column!" do
    it "rearranges the cards correctly when choosing the first column" do
      expected_cards = [
        2, 5, 8, 11, 14, 17, 20,
        1, 4, 7, 10, 13, 16, 19,
        3, 6, 9, 12, 15, 18, 21
      ]
      @trick.choose_column! 0
      @trick.deck.cards.must_equal expected_cards
    end

    it "rearranges the cards correctly when choosing the second column" do
      expected_cards = [
        1, 4, 7, 10, 13, 16, 19,
        2, 5, 8, 11, 14, 17, 20,
        3, 6, 9, 12, 15, 18, 21
      ]
      @trick.choose_column! 1
      @trick.deck.cards.must_equal expected_cards
    end

    it "rearranges the cards correctly when choosing the third column" do
      expected_cards = [
        1, 4, 7, 10, 13, 16, 19,
        3, 6, 9, 12, 15, 18, 21,
        2, 5, 8, 11, 14, 17, 20
      ]
      @trick.choose_column! 2
      @trick.deck.cards.must_equal expected_cards
    end
  end

  describe "#cards_in_column" do
    it "returns the cards in the given column" do
      col_1 = [1, 4, 7, 10, 13, 16, 19]
      col_2 = [2, 5, 8, 11, 14, 17, 20]
      col_3 = [3, 6, 9, 12, 15, 18, 21]
      @trick.cards_in_column(0).must_equal col_1
      @trick.cards_in_column(1).must_equal col_2
      @trick.cards_in_column(2).must_equal col_3
    end
  end

  describe ".indexes_for_column" do
    it "returns the indexes for the given column" do
      col_1 = [0, 3, 6, 9,  12, 15, 18]
      col_2 = [1, 4, 7, 10, 13, 16, 19]
      col_3 = [2, 5, 8, 11, 14, 17, 20]
      Trick.indexes_for_column(0).must_equal col_1
      Trick.indexes_for_column(1).must_equal col_2
      Trick.indexes_for_column(2).must_equal col_3
    end
  end
end
