class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_ranking = []

    @cards.each do |card|
        high_ranking << card if card.rank >= 11
    end

    high_ranking
  end

  def percent_high_ranking
    total_cards = @cards.count

    (high_ranking_cards.length.to_f / total_cards * 100.00).round(2)
  end

  def remove_card

    @cards.shift
  end

  def add_card(card)

    @cards.push(card)
  end
end
