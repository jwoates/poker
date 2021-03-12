# frozen_string_literal: true

require 'pp'
require './lib/card'
require './lib/hand'
require './lib/game'


fixture_1 = [
  {suit: 'c', value: 2},
  {suit: 'd', value: 3},
  {suit: 'd', value: 4},
  {suit: 'h', value: 5},
  {suit: 'd', value: 6}
]
h1 = []
fixture_1.each do |card|
  h1 << Card.new(*card.values)
end

hand_1 = Hand.new h1

fixture_2 = [
  {suit: 'd', value: 2},
  {suit: 'd', value: 2},
  {suit: 'd', value: 2},
  {suit: 'h', value: 2},
  {suit: 'd', value: 9}
]
h2 = []
fixture_2.each do |card|
  h2 << Card.new(*card.values)
end

hand_2 = Hand.new h2


game = Game.new(hand_1, hand_2)

pp('∆ -------------------------------------')
pp "#{hand_1.clean_name} => #{hand_1.score}"
pp "#{hand_2.clean_name} => #{hand_2.score}"
pp '...'

pp game.winner.clean_name
pp game.looser.clean_name

pp('∆ -------------------------------------')
