class Card

  attr_reader :suit , :rank , :c_string

  def initialize(suit , rank)
    @suit = suit
    @rank = rank
    @c_string = "#{rank}#{suit}"
  end
end
