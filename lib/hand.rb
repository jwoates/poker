# frozen_string_literal: true

# [x] Royal Flush: Ten, Jack, Queen, King, Ace, in same suit. // straight-flush, but higher card val
# [x] Straight Flush: All cards are consecutive values of same suit. // flush + straight
# [x] Four of a Kind: Four cards of the same value.
# [x] Full House: Three of a kind and a pair.
# [x] Flush: All cards of the same suit.
# [x] Straight: All cards are consecutive values.
# [x] Three of a Kind: Three cards of the same value.
# [x] Two Pairs: Two different pairs.
# [x] One Pair: Two cards of the same value.
# [x] High Card: Highest value card.

##
# takes an array of 5 Cards and scores the hand
class Hand
  attr_reader :cards, :hight_card

  TOTAL_CARDS = 5

  # NOTE: no need for a Royal Flush mapping, straigh_flush high card will win
  SCORE_MAPPING = %i[
    straight_flush?
    four_of_a_kind?
    full_house?
    flush?
    straight?
    three_of_a_kind? 
    two_pairs? 
    one_pair? 
    high_card?
  ].freeze

  def initialize(cards)
    @cards = cards.sort
    @values = @cards.sort.map(&:value)
    @hight_card = @cards.sort.map(&:score)
    @score = score
  end

  def score
    # NOTE: reverse the index to get a proper score
    SCORE_MAPPING.reverse.index(name)
  end

  # sorting ......................... START HERE .............................
  def <=>(other)
    if name == other.name
      @hight_card <=> other.hight_card
    else
      score <=> other.score
    end
  end

  def name
    SCORE_MAPPING.find do |method|
      return method if send(method)
    end
  end

  # for testing ....................................................................................
  def clean_name
    return name.to_s.delete_suffix('?')
  end
  # for testing ....................................................................................

  private

  # hands
  def high_card?
    [one_pair?, three_of_a_kind?, full_house?, straight?, straight_flush?].none?
  end

  def one_pair?
    group_size(2)
  end

  def two_pairs?
    @values.uniq.size == 3
  end

  def three_of_a_kind?
    group_size(3)
  end

  def four_of_a_kind?
    group_size(4)
  end

  def full_house?
    [one_pair?, three_of_a_kind?].all?
  end

  def straight?
    consecutive.count == TOTAL_CARDS
  end

  def flush?
    @cards.map(&:suit).uniq.size == 1
  end

  def straight_flush?
    [straight?, flush?].all?
  end

  # helpers
  def group_size(size)
    clusters.values.any? { |values| values.size == size }
  end

  def clusters
    @cards.group_by(&:value)
  end

  def consecutive
    @cards.slice_when do |prev, cur|
      (prev.score + 1) == cur.score
    end
  end
end
