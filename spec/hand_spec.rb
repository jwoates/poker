# frozen_string_literal: true

require './support/helper'
require './fixtures/hands'

RSpec.describe Hand do  # rubocop:disable Metrics/BlockLength
  # build hands straight_flush..high_card
  HANDS.each do |h|
    let(h[0]) { build_hand(h[1]) }
  end

  let(:hands) do
    [{ name: straight_flush, result: 10 }, 
     { name: ace_low_straight_flush, result: 9 }, 
     { name: four_of_a_kind, result: 8 },
     { name: full_house, result: 7 }, 
     { name: flush, result: 6 }, 
     { name: straight, result: 5 },
     { name: ace_low_straight, result: 4 },
     { name: three_of_a_kind, result: 3 }, 
     { name: two_pairs, result: 2 },
     { name: one_pair, result: 1 }, 
     { name: high_card, result: 0 }]
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
      expect(collection.max.score).to eq 10
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
  end

  describe 'scores same type hands' do  # rubocop:disable Metrics/BlockLength
    context 'when high card' do
      let(:high_hand) { build_hand(HANDS[:high_card]) }
      let(:low_hand) { build_hand(HANDS[:high_card_nine]) }
      let(:collection) do
        [] << high_hand << low_hand
      end
      it 'sorts by highest card valuer' do
        expect(collection.max).to be high_hand
      end

      it 'sorts by lowest card value' do
        expect(collection.min).to be low_hand
      end
    end

    context 'when one pair' do
      let(:high_hand) { build_hand(HANDS[:one_pair_high]) }
      let(:low_hand) { build_hand(HANDS[:one_pair]) }
      let(:collection) do
        [] << low_hand << high_hand
      end
      it 'sorts by highest pair' do
        expect(collection.max).to be high_hand
      end

      it 'sorts by lowest pair' do
        expect(collection.min).to be low_hand
      end
    end

    context 'when two_pair' do
      context 'when highest pair are different' do
        let(:high_hand) { build_hand(HANDS[:two_pairs_high]) }
        let(:low_hand) { build_hand(HANDS[:two_pairs]) }
        let(:collection) do
          [] << low_hand << high_hand
        end
        it 'sorts by highest of the pairs' do
          expect(collection.max).to be high_hand
        end

        it 'sorts by lowest of the pairs' do
          expect(collection.min).to be low_hand
        end
      end
    end

    context 'when highest pair are the same' do
      let(:high_hand) { build_hand(HANDS[:two_pairs_low_high]) }
      let(:low_hand) { build_hand(HANDS[:two_pairs_low_low]) }
      let(:collection) do
        [] << low_hand << high_hand
      end
      it 'sorts by highest of the pairs' do
        expect(collection.max).to be high_hand
      end

      it 'sorts by lowest of the pairs' do
        expect(collection.min).to be low_hand
      end
    end
  end
end

context 'when three_of_a_kind' do
  let(:high_hand) { build_hand(HANDS[:three_of_a_kind_high]) }
  let(:low_hand) { build_hand(HANDS[:three_of_a_kind]) }
  let(:collection) do
    [] << low_hand << high_hand
  end
  it 'sorts by highest of the tripplets' do
    expect(collection.max).to be high_hand
  end

  it 'sorts by lowest of the tripplets' do
    expect(collection.min).to be low_hand
  end
end

context 'when straights' do
  let(:high_hand) { build_hand(HANDS[:straight_high]) }
  let(:low_hand) { build_hand(HANDS[:straight]) }
  let(:collection) do
    [] << low_hand << high_hand
  end
  it 'sorts by highest card in straight' do
    expect(collection.max).to be high_hand
  end

  it 'sorts by lowest card in straight' do
    expect(collection.min).to be low_hand
  end
end

context 'when ace low staraight' do
  let(:high_hand) { build_hand(HANDS[:straight]) }
  let(:low_hand) { build_hand(HANDS[:ace_low_straight]) }
  let(:collection) do
    [] << low_hand << high_hand
  end

  it 'sorts by highest card in straight' do
    expect(collection.max).to be high_hand
  end

  it 'sorts by lowest card in straight' do
    expect(collection.min).to be low_hand
  end
end

context 'when ace low staraight flush' do
  let(:high_hand) { build_hand(HANDS[:straight_flush]) }
  let(:low_hand) { build_hand(HANDS[:ace_low_straight_flush]) }
  let(:collection) do
    [] << low_hand << high_hand
  end

  it 'sorts by highest card in straight' do
    expect(collection.max).to be high_hand
  end

  it 'sorts by lowest card in straight' do
    expect(collection.min).to be low_hand
  end
end

context 'when both are flushes' do
  let(:high_hand) { build_hand(HANDS[:royal_flush]) }
  let(:low_hand) { build_hand(HANDS[:straight_flush]) }

  let(:collection) do
    [] << low_hand << high_hand
  end

  it 'sorts by highest card' do
    expect(collection.max).to be high_hand
  end

  it 'sorts by lowest card' do
    expect(collection.min).to be low_hand
  end
end

context 'when both are full houses' do
  let(:high_hand) { build_hand(HANDS[:full_house_high]) }
  let(:low_hand) { build_hand(HANDS[:full_house]) }

  let(:collection) do
    [] << low_hand << high_hand
  end

  it 'sorts by highest tripplet in full house' do
    expect(collection.max).to be high_hand
  end

  it 'sorts by lowest tripplet in full house' do
    expect(collection.min).to be low_hand
  end
end
