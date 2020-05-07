# require './lib/card'

class Deck
  attr_reader :cards

  def initialize(*cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    @cards[index].rank

  end

  def high_ranking_cards

    high_ranking = []

    @cards.each do |card|
      if card.rank >= 11
        high_ranking << card

      end
    end

    high_ranking
  end

  def percent_high_ranking

    total_cards = @cards.count

    percent_to_two_decimals = (high_ranking_cards.length.to_f / total_cards * 100.00).round(2)
  end

  def remove_card

    @cards.shift
  end

  # def add_card
  #
  # end



end
