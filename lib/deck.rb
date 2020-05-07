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
    num_high_ranking = 0.0

    @cards.each do |num|
      if num.rank >= 11
        num_high_ranking += 1.0

      end
    end

    percent_to_two_decimals = (num_high_ranking / total_cards * 100.00).round(2)
  end

  def remove_card

    @cards.shift
  end

  # def add_card
  #
  # end



end
