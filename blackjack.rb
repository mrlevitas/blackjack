#!/usr/bin/env ruby
require 'pry'
require_relative 'deck'
require_relative 'hand'

class Blackjack

  attr_reader :player_hand, :dealer_hand
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new("Player")
    @dealer_hand = Hand.new("Dealer")

  end

  def play
    puts "Welcome to Blackjack!\n\n"
    deal_cards
    display(@player_hand)
    hit_me
    display(@dealer_hand)
    dealers_decision
    who_won
  end

  #private - Commented out just so we can perform unit testing
  def deal_cards
    2.times do
      @player_hand.cards << @deck.deal
      @dealer_hand.cards << @deck.deal
    end
  end

  def display(player)
    player.cards.each do |card|
      puts "#{player.name} was dealt #{card.c_string}"
    end
    puts "#{player.name} score: #{player.calculate_hand}\n\n"
  end

  def display_score(player)
    puts "#{player.name} Score: #{player.calculate_hand}"
    if player.calculate_hand > 21
      puts "Bust! #{player.name} you lose...\n\n"
      puts "Player wins!" if player.name == "Dealer"
      exit
    end
  end

  def hit_me
    while prompt_user
      new_card = @deck.deal
      puts "Player was dealt #{new_card.c_string}"
      @player_hand.cards << new_card
      display_score(@player_hand)
     end
  end

  def dealers_decision
    while @dealer_hand.calculate_hand < 17
      new_card = @deck.deal
      puts "Dealer was dealt #{new_card.c_string}"
      @dealer_hand.cards << new_card
      display_score(@dealer_hand)
    end
    puts "Dealer Stands.\n\n"
  end

  def who_won
    puts @player_hand.calculate_hand > @dealer_hand.calculate_hand ? "Player wins!" : "Player loses!"
  end

  def prompt_user
    puts "Hit or stand (H/S):"
    input = gets.chomp.downcase

    if input == "h"
      true
    elsif input == "s"
      false
    else
      puts "Wrong input"
      exit
    end
  end
end

game = Blackjack.new
game.play
