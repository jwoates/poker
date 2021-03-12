# frozen_string_literal: true

require './lib/card'
require './lib/hand'

def build_hand(data)
  cards = []
  data.each { |card| cards << Card.new(*card.values) }
  Hand.new cards
end
