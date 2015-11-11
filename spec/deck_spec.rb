require_relative '../lib/deck'
require_relative '../lib/card'

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck after being built" do
      sorted_deck = deck.cards.sort_by { |card| [card.value, card.suit] }
      expect(sorted_deck).to_not eq deck.cards
      # it is good not to rely on negative tests alone
      # so we assert that after sorting the deck it looks like we expect
      expect(sorted_deck[0].suit).to eq ("c")
      expect(sorted_deck[0].value).to eq ("10")
      # expect(deck.cards[0].suit).to_not eq('d')
      # expect(deck.cards[0].value).to_not eq('2')
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end
