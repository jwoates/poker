# frozen_string_literal: true

##
# sort best and worst hands
class Game
  TOTAL_HANDS = 2

  attr_reader :hands

  def initialize(hands)
    # raise ArgumentError, "Requires exactly #{TOTAL_HANDS} hands, not #{hands.size}" if hands.size != TOTAL_HANDS

    @hands = hands
  end

  def winning_hand
    sorted.first[:hand] 
  end

  def winning_player
    sorted.first[:player] 
  end

  def loosing_hand
    sorted.last[:hand] 
  end

  def loosing_player
    sorted.last[:player] 
  end

  private

  def sorted
    @sorted ||= @hands.sort_by { |hash| hash[:hand] }.reverse
  end
end
