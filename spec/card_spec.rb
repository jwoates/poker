# frozen_string_literal: true

require './lib/card'

RSpec.describe Card do
  let(:cards) do
    [{ value: 'A', result: 12 }, { value: 5, result: 3 }, { value: 't', result: 8 },
     { value: 'J', result: 9 }, { value: 'q', result: 10 }, { value: 2, result: 0 },
     { value: 3, result: 1 }]
  end

  describe 'scores cards' do
    it 'assigns value to card' do
      cards.each { |pair| expect(Card.new('h', pair[:value]).score).to eq pair[:result] }
    end
  end

  describe 'sorts cards' do
    let(:collection) do
      set = []
      cards.each do |card|
        set << Card.new('h', card[:value])
      end
      set
    end

    it 'sorts lowest score first' do
      expect(collection.min.score).to eq 0
    end
    it 'sorts highest score last' do
      expect(collection.max.score).to eq 12
    end
  end
end
