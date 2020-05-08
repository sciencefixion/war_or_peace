
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

   def type

     if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)

       return :war

     elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)

       return :mutually_assured_destruction

     else


       :basic
     end

    end



  def winner

    if type == :basic

        if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)

          return player1
        elsif player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)

        else

          player2
        end

    elsif type == :war

        if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)

          return player1
        else

          player2
        end



    else

      "No Winner"
    end

  end

  def pile_cards

  end

  def award_spoils

  end


end
