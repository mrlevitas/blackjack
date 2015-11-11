require "pry"
require_relative 'deck'


class Hand

  attr_accessor :cards
  attr_reader :name

  def initialize(name)
    @cards = []
    @name = name
  end

  def calculate_hand
    score = 0
    aces = 0
    
    @cards.each do |card|
      case card.rank
      when "J", "Q", "K"
        score += 10
      when "A"
        score += 11
        aces += 1
      else
        score += card.rank.to_i
      end
    end

    while (aces > 0) && (score > 21)
      score -= 10
      aces -= 1
    end

  score
  end
end
