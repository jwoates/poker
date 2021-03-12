# frozen_string_literal: true

##
# card with suit and value
class Card
  attr_reader :suit, :value

  KNOWN_SUITS = %i[h d c s].freeze
  KNOWN_VALUES = %i[2 3 4 5 6 7 8 9 10 j q k a].freeze

  def initialize(suit, value)
    @suit = symbolize suit
    @value = symbolize value
  end

  def <=>(other)
    score.to_i <=> other.score.to_i
  end

  def score
    Card::KNOWN_VALUES.index(@value)
  end

  private

  def symbolize(val)
    val.to_s.downcase.to_sym
  end
end
