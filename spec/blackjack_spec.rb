require "pry"
require_relative '../blackjack'

describe Deck do
  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 1

      deck.deal

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal).to eq correct_card
    end
  end
end

describe Hand do
  describe "#calculate_hand returns a score" do
    it "should calculate 2♦, J♥ , 4♥ as 16" do
      hand1 = Hand.new("Player_1")
      hand1.cards << Card.new('♦','2')
      hand1.cards << Card.new('♥','J')
      hand1.cards << Card.new('♥','4')
      expect(hand1.calculate_hand).to eq (16)
    end

    it "should calculate A♦, J♥ , 4♥ as 15" do
      hand2 = Hand.new("Player_2")
      hand2.cards << Card.new('♦','A')
      hand2.cards << Card.new('♥','J')
      hand2.cards << Card.new('♥','4')
      expect(hand2.calculate_hand).to eq (15)
    end

    it "should calculate A♦, J♥ as 21" do
      hand3 = Hand.new("Player_1")
      hand3.cards << Card.new('♦','A')
      hand3.cards << Card.new('♥','J')
      expect(hand3.calculate_hand).to eq (21)
    end
  end
end

describe Blackjack do
  let(:blackjack) { Blackjack.new }
  describe ".new" do
    it "is a Blackjack class" do
      expect(blackjack).to be_a(Blackjack)
    end
    it "should have empty hands" do
      expect(blackjack.player_hand.cards).to eq([])
      expect(blackjack.dealer_hand.cards).to eq([])
    end
  end
  describe "#deal_cards" do
    it "should have two cards in each player's hands" do
      blackjack.deal_cards
      expect(blackjack.player_hand.cards.length).to eq(2)
      expect(blackjack.dealer_hand.cards.length).to eq(2)
    end
  end
  describe "#display(arugment)" do
    it "should tell the user what cards they have" do
      hand1 = Hand.new("Player_1")
      hand1.cards << Card.new('♦','2')
      hand1.cards << Card.new('♥','J')
      hand1.cards << Card.new('♥','4')
      expect{blackjack.display(hand1)}.to output("Player_1 was dealt 2♦\nPlayer_1 was dealt J♥\nPlayer_1 was dealt 4♥\nPlayer_1 score: 16\n\n").to_stdout
    end
  end
  describe "#hit_me" do
    it "should accept an input 'stand' and return nil" do
      allow(blackjack).to receive(:gets).and_return('s')
      expect(blackjack.hit_me).to eq(nil)
    end
    it "should accept an input 'hit' and return nil" do
      allow(blackjack).to receive(:gets).and_return('h')
      allow(blackjack).to receive(:gets).and_return('s')
      expect(blackjack.hit_me).to eq(nil)
    end
  end
  # describe "#dealers_decision" do
  #   it "should end with 'Dealer Stands.'" do
  #     expect{blackjack.dealers_decision}.to output(/Dealer Stands.\z/).to_stdout
  #   end
  # end
end
