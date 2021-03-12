# frozen_string_literal: true

require './lib/hand'
require './lib/card'
require './fixtures/hands'

RSpec.describe Hand do
  # Card = Struct.new(:suit, :value)
  #
  def build_hand(data)
    cards = []
    data.each { |card| cards << Card.new(*card.values) }
    Hand.new cards
  end

  # build hands straight_flush..high_card
  HANDS.each do |h|
    let(h[0]) { build_hand(h[1]) }
  end

  let(:hands) do
    [{ name: straight_flush, result: 8 }, { name: four_of_a_kind, result: 7 },
     { name: full_house, result: 6 }, { name: flush, result: 5 }, { name: straight, result: 4 },
     { name: three_of_a_kind, result: 3 }, { name: two_pairs, result: 2 },
     { name: one_pair, result: 1 }, { name: high_card, result: 0 }]
  end

  describe 'sorts hands' do
    # TODO: build test set with expectations
    let(:collection) do
      [] << build_hand(HANDS[:straight_flush]) << build_hand(HANDS[:one_pair])
    end

    it 'sorts lowest score first' do
      expect(collection.min.score).to eq 1
    end
    it 'sorts highest score last' do
      expect(collection.max.score).to eq 8
    end
  end

  describe 'scores hands' do
    context 'when different type hands' do
      it 'assigns value to a hand' do
        hands.each do |hand|
          expect(hand[:name].score).to be hand[:result]
        end
      end
    end

    context 'when same type hands' do
      let(:high_hand) { build_hand(HANDS[:high_card_9]) }
      let(:med_hand) { build_hand(HANDS[:high_card_8]) }
      let(:low_hand) { build_hand(HANDS[:high_card_7]) }
      let(:collection) do
        [] << low_hand << high_hand << med_hand
      end

      it 'sorts by highest card' do
        expect(collection.max).to eq high_hand
      end

      # it 'sorts by lowest card' do
      #   expect(collection.min).to eq low_hand
      # end
    end
  end
end
