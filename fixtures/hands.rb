# frozen_string_literal: true

HANDS = {
  straight_flush: [
    { suit: 'h', value: 6 },
    { suit: 'h', value: 7 },
    { suit: 'h', value: 8 },
    { suit: 'h', value: 9 },
    { suit: 'h', value: 10 }
  ],
  four_of_a_kind: [
    { suit: 'c', value: 5 },
    { suit: 'd', value: 5 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 5 },
    { suit: 'd', value: 6 }
  ],
  full_house: [
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
    { suit: 'd', value: 10 },
    { suit: 'd', value: 3 }
  ],
  straight: [
    { suit: 'd', value: 7 },
    { suit: 'd', value: 8 },
    { suit: 'd', value: 9 },
    { suit: 'h', value: 10 },
    { suit: 'd', value: 'J' }
  ],
  three_of_a_kind: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
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
  one_pair: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 2 },
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
  high_card_9: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 4 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 9 },
  ],
  high_card_8: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 4 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 8 },
  ],
  high_card_7: [
    { suit: 'd', value: 2 },
    { suit: 'd', value: 3 },
    { suit: 'd', value: 4 },
    { suit: 'd', value: 5 },
    { suit: 'h', value: 7 }
  ]
}.freeze
