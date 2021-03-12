# frozen_string_literal: true
#

class Game
  def initialize(*hands)
    @hands = hands
  end

  def winner
    @hands.max
    # @hands.max
  end

  def looser
    @hands.min
  end

  def test
    @hands.sort
  end
end
