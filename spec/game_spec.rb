# frozen_string_literal: true

require './lib/game'
require './support/helper'
require './fixtures/hands'

RSpec.describe Game do
  describe 'rounds' do
    let(:high_hand) { build_hand(HANDS[:straight_flush]) }
    let(:low_hand) { build_hand(HANDS[:one_pair]) }
    let(:high_card_seven) { build_hand(HANDS[:high_card_seven]) }
    let(:high_card_nine) { build_hand(HANDS[:high_card_nine]) }
    let(:player_one) { 'Foo' }
    let(:player_two) { 'Bar' }

    def build_hands(hands)
      [] << { player: player_one, hand: hands.first } << { player: player_two, hand: hands.last }
    end

    # TODO: organize into data set with result
    context 'straight_flush..one_pair' do
      let(:collection) { build_hands([low_hand, high_hand]) }
      let(:game) { Game.new(collection) }

      it '.winning_hand' do
        expect(game.winning_hand).to be high_hand
      end
      it '.winning_player' do
        expect(game.winning_player).to eq player_two
      end

      it '.loosing_hand' do
        expect(game.loosing_hand).to be low_hand
      end
      it '.loosing_player' do
        expect(game.loosing_player).to eq player_one
      end
    end

    context 'high_card_seven..high_card_nine' do
      let(:collection) { build_hands([high_card_nine, high_card_seven]) }
      let(:game) { Game.new(collection) }

      it '.winning_hand' do
        expect(game.winning_hand).to be high_card_nine
      end
      it '.loosing_hand' do
        expect(game.loosing_hand).to be high_card_seven
      end
    end
  end
end
