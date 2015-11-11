require_relative '../blackjack'

describe Blackjack do
  let(:blackjack) { Blackjack.new }

  describe '.new' do
    it 'creates two hands of two cards' do
      expect(blackjack.player.hand.cards).to eq([])
    end
    #
    # it 'displays a message for player receiving a card' do
    #   expect(blackjack.play_game).to receive(:gets).and_return("h")
    #   expect{blackjack.play_game}.to output(/Player was dealt CARD/).to_stdout
    # end
    #
    # it 'displays a message for dealer receiving a card' do
    #   expect{blackjack}.to output(/Dealer was dealt CARD/).to_stdout
    # end
  end

  describe '#play_game' do
    # context 'player has a hand and does not bust, dealer has a hand and does not bust' do
    # context "player's turn" do
    let(:high_hand) { Hand.new([Card.new('d', 'Q'), Card.new('h', 'J')]) }
    let(:low_hand) { Hand.new([Card.new('d', '5'), Card.new('h', '7'), Card.new('d', 'A')]) }
    let(:bust_hand) { Hand.new([Card.new('s', 'Q'), Card.new('d', 'K'), Card.new('h', '2')]) }

    context "player wins" do
      it "player hand value exceeds dealer hand value" do
        a = blackjack

        high_hand.cards.each do |card|
          a.player.hand.add_card(card)
        end

        low_hand.cards.each do |card|
          a.dealer.hand.add_card(card)
        end

        expect(a.player.hand.calculate_hand).to eq(20)
        expect(a.dealer.hand.calculate_hand).to eq(13)

        # expect(a.play_game).to receive(:gets).and_return("s")

      end

      it "dealer busts" do

      end
    end

    context "dealer wins" do
      it "player busts" do

      end

      it "dealer hand value exceeds player hand value" do
        a = blackjack

        high_hand.cards.each do |card|
          a.dealer.hand.add_card(card)
        end

        low_hand.cards.each do |card|
          a.player.hand.add_card(card)
        end

        expect(a.player.hand.calculate_hand).to eq(13)
        expect(a.dealer.hand.calculate_hand).to eq(20)
      end

    end

    it "tie game" do

    end
  end

end
