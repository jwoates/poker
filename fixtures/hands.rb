# frozen_string_literal: true

HANDS = {
  royal_flush: [
    { suit: 'h', value: 'a' },
    { suit: 'h', value: 'k' },
    { suit: 'h', value: 'q' },
    { suit: 'h', value: 'j' },
    { suit: 'h', value: 't' }
  ],
  straight_flush: [
    { suit: 'h', value: 6 },
    { suit: 'h', value: 7 },
    { suit: 'h', value: 8 },
    { suit: 'h', value: 9 },
    { suit: 'h', value: 't' }
  ],
  four_of_a_kind: [
    { suit: 'c', value: 5 },
    { suit: 'd', value: 5 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 5 },
    { suit: 'd', value: 6 }
  ],
  full_house: [
    { suit: 'd', value: 'j' },
    { suit: 'h', value: 'j' },
    { suit: 'c', value: 'j' },
    { suit: 'd', value: 8 },
    { suit: 's', value: 8 }
  ],
  full_house_high: [
    { suit: 'd', value: 'a' },
    { suit: 'h', value: 'a' },
    { suit: 'c', value: 'a' },
    { suit: 'd', value: 8 },
    { suit: 's', value: 8 }
  ],
  flush: [
    { suit: 'd', value: 7 },
    { suit: 'd', value: 8 },
    { suit: 'd', value: 9 },
    { suit: 'd', value: 't' },
    { suit: 'd', value: 3 }
  ],
  straight: [
    { suit: 'd', value: 7 },
    { suit: 'd', value: 8 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 't' },
    { suit: 'd', value: 'J' }
  ],
  straight_high: [
    { suit: 'd', value: 8 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 't' },
    { suit: 'd', value: 'J' },
    { suit: 'd', value: 'q' }
  ],
  three_of_a_kind: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'J' }
  ],
  three_of_a_kind_high: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 9 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'J' }
  ],
  two_pairs: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'k' }
  ],
  two_pairs_high: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'd', value: 't' },
    { suit: 'h', value: 't' },
    { suit: 'd', value: 'q' }
  ],
  two_pairs_low_low: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'k' }
  ],
  two_pairs_low_high: [
    { suit: 'd', value: 3 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'k' }
  ],
  one_pair: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'q' }
  ],
  one_pair_high: [
    { suit: 'd', value: 'k' },
    { suit: 'd', value: 'k' },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'q' }
  ],
  high_card: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 9 },
    { suit: 'd', value: 'q' }
  ],
  high_card_nine: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 4 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 9 }
  ],
  high_card_eight: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 4 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 8 }
  ],
  high_card_seven: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 4 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 7 }
  ]
}.freeze
