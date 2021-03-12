# frozen_string_literal: true

##
# sort best and worst hands
class Game
  TOTAL_HANDS = 2

  def initialize(hands)
    raise ArgumentError, "Requires exactly #{TOTAL_HANDS} hands, not #{hands.size}" if hands.size != TOTAL_HANDS
    @hands = hands
  end

  def winner
    @hands.max
  end

  def looser
    @hands.min
  end
end
