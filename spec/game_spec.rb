# frozen_string_literal: true

require './lib/game'
require './support/helper'
require './fixtures/hands'

RSpec.describe Game do
  describe '.winner' do
    let(:high_hand) { build_hand(HANDS[:straight_flush]) }
    let(:low_hand) { build_hand(HANDS[:one_pair]) }
    let(:high_card_seven) { build_hand(HANDS[:high_card_seven]) }
    let(:high_card_nine) { build_hand(HANDS[:high_card_nine]) }

    # TODO: organize into data set with result
    context 'straight_flush..one_pair' do
      let(:collection) do
        [] << high_hand << low_hand
      end
      let(:game) { Game.new(collection) }

      it 'has a winner' do
        expect(game.winner).to be high_hand
      end
      it 'has a looser' do
        expect(game.looser).to be low_hand
      end
    end

    context 'high_card_seven..high_card_nine' do
      let(:collection) do
        [] << high_card_nine << high_card_seven
      end
      let(:game) { Game.new(collection) }

      it 'has a winner' do
        expect(game.winner).to be high_card_nine
      end
      it 'has a looser' do
        expect(game.looser).to be high_card_seven
      end
    end
  end
end
