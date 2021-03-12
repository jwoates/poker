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

# TODO: this is too complex and needs to be refactored
def build_game(line) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  hands = build_player_cards(line.split)
  h1 = build_hand(hands.first)
  h2 = build_hand(hands.last)
  game = Game.new([h1, h2])

  $game_count += 1
  case game.winner
  when h1
    $player_one_win_count += 1
    report = { winner: :player_one, looser: :player_two, winning_hand: hands.first,
               loosing_hand: hands.last }
  when h2
    $player_two_win_count += 1
    report = { winner: :player_two, looser: :player_one, winning_hand: hands.last,
               loosing_hand: hands.first }
  else
    raise Error, "should always be a winner in game #{game}"
  end
  report[:game_count] = $game_count
  $report << report
end

# read each line of the data in and create a game
File.readlines(file).each { |line| build_game(line) }

$report.each do |line|
  pp "Round: #{line[:game_count]} - W: #{line[:winner]}, L: #{line[:looser]}, winning hand: #{line[:winning_hand].join(' ')}, loosing_hand: #{line[:loosing_hand].join(' ')}" # rubocop:disable Layout/LineLength
end

# output
pp "Player One win count: #{$player_one_win_count}"
pp "Player Two win count: #{$player_two_win_count}"
pp "execuited in #{(Time.now - time) * 1000}ms"
