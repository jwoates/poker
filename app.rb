# frozen_string_literal: true

require 'pp'
require './lib/card'
require './lib/hand'
require './lib/game'

time = Time.now
SUITS = %w[S,D,C,H].freeze
$report = []
$game_count = 0
$player_one_win_count = 0
$player_two_win_count = 0

file = './poker.txt'

def build_hand(cards)
  card_arr = []
  cards.each { |c| card_arr << build_card(c) }
  Hand.new(card_arr)
end

def build_player_cards(cards)
  cards.each_slice(5).to_a
end

def build_card(card)
  parts = card.split(/|#{SUITS}|/)
  Card.new(parts.last, parts.first)
end

def build_game(line)
  hands = build_player_cards(line.split)
  played_hands = [
    { player: 'Player 1', hand: build_hand(hands.first) },
    { player: 'Player 2', hand: build_hand(hands.last) }
  ]

  game = Game.new(played_hands)
  $game_count += 1
  $report <<  { game_count: $game_count, winner: game.winning_player,
                looser: game.loosing_player, winning_hand: game.winning_hand,
                loosing_hand: game.loosing_hand }
end

# read each line of the data in and create a game
File.readlines(file).each { |line| build_game(line) }

def player_win_count(player)
  $report.select { |h| h[:winner] == player }
end

# output
$report.each do |line|
  puts "Round: #{line[:game_count]} - W: #{line[:winner]}, L: #{line[:looser]}, winning hand: #{line[:winning_hand].format_for_report}, loosing_hand: #{line[:loosing_hand].format_for_report}" # rubocop:disable Layout/LineLength
end

puts "Player One win count: #{player_win_count('Player 1').count}"
puts "Player Two win count: #{player_win_count('Player 2').count}"
puts "execuited in #{((Time.now - time) * 1000).round}ms"
