# Blackjack
Complete, object oriented, terminal based implementation of blackjack game with 13 rspec unit tests.

# Game Rules

Blackjack is a card game between a player and the dealer using a deck of 52 cards. The object of the game is to reach a score as close to 21 as possible without exceeding it (bust). Both the dealer and the player are initially dealt two cards and have the option to receive another card (hit) or keep their current score (stand). The player can continually hit until they score 21 or bust. A dealer is required to stand on anything inclusively between 17 and 21

A score is calculated by adding up the values of the cards in a player's hand. Face cards (Jack, Queen, King) are worth 10 points and Aces are worth either 1 point or 11 points (whichever value yields the best score).

The player is dealt first and continues to play until they bust or stand. Once a player stands, the dealer will then play until they bust or stand. If a player busts, the dealer wins. If the dealer busts, the player wins. If neither busts, whoever has the score closest to 21 wins. In case of a tie, neither the player nor the dealer wins.


# to Play

```no-highlight
$ git clone https://github.com/mrlevitas/blackjack.git 
$ cd blackjack
$ ruby blackjack.rb
```


# to run test
```no-highlight
$ rspec
```

