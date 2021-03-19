# frozen_string_literal: true
##
# takes an array of 5 Cards and scores the hand
class Hand
  attr_reader :cards, :high_card

  TOTAL_CARDS = 5

  SCORE_MAPPING = %i[
    straight_flush?
    ace_low_straight_flush?
    four_of_a_kind?
    full_house?
    flush?
    straight?
    ace_low_straight?
    three_of_a_kind?
    two_pairs?
    one_pair?
    high_card?
  ].freeze

  def initialize(cards)
    @cards = cards.sort
    @values = @cards.sort.map(&:value)
    @high_card = @cards.sort.map(&:score)
    @score = score_set
  end

  # return hand value from mapping index
  def score
    # NOTE: reverse the index to get a proper score
    SCORE_MAPPING.reverse.index(name)
  end

  # size of largest cluster
  def secondary_score
    group_cluster_size
  end

  # card value from largest cluster
  def tertiary_score
    group_cluster_value
  end

  def <=>(other)
    if score_set == other.score_set
      second_cluster_value <=> other.second_cluster_value
    else
      score_set <=> other.score_set
    end
  end

  def name
    SCORE_MAPPING.find do |method|
      return method if send(method)
    end
  end

  def score_set
    [score, secondary_score, tertiary_score]
  end

  def second_cluster_value
    clusters.sort { |a, b| a[1].size <=> b[1].size }.reverse[1].drop(1).flatten.first.score
  end

  def format_for_report
    @cards.map { |c| "#{c.value.upcase}#{c.suit.upcase}" }.join(', ')
  end

  private

  # helpers
  def group_size(size)
    clusters.values.any? { |values| values.size == size }
  end

  def group_cluster(index)
    # this is rough
    clusters.sort { |a, b| a[index].size <=> b[index].size }.reverse.first.drop(1)
  end

  def group_cluster_size
    group_cluster(1).flatten.size
  end

  def group_cluster_value
    group_cluster(1).flatten.first.score
  end

  def clusters
    @cards.group_by(&:value)
  end

  def consecutive
    @cards.slice_when do |prev, cur|
      (prev.score + 1) == cur.score
    end
  end

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

  def ace_low_straight?
    # NOTE: sort will still put Ace at the end
    return false unless @cards.first.value == :'2' && @cards.last.value == :a

    consecutive.count == 4
  end

  def flush?
    @cards.map(&:suit).uniq.size == 1
  end

  def straight_flush?
    [straight?, flush?].all?
  end

  def ace_low_straight_flush?
    [ace_low_straight?, flush?].all?
  end
end
