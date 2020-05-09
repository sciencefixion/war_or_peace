require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup

    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:diamond, '8', 8)

  end

  def test_it_exists

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_can_have_players

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_spoils_of_war_is_an_empty_array

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    assert_equal [], turn.spoils_of_war
  end

  def test_it_can_tell_type_basic

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    assert_equal :basic, turn.type
  end

  def test_it_can_tell_type_war

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_can_tell_type_mutually_assured_destruction

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card9, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_can_tell_winner_basic

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)



    assert_equal player1, turn.winner
  end

  def test_it_can_tell_winner_war

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_it_can_tell_no_winner

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card9, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_it_can_pile_cards_basic

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    turn.pile_cards


    assert_equal [@card1, @card3], turn.spoils_of_war

  end

  def test_it_can_pile_cards_war

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    turn.pile_cards


    assert_equal [@card1, @card4, @card2, @card3, @card5, @card6], turn.spoils_of_war

  end

  def test_it_removes_cards_if_mutually_assured_destruction

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card9, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards


    assert_equal [@card8], player1.deck.cards
    assert_equal [@card7], player2.deck.cards
  end

  def test_it_can_award_spoils_basic

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    winner = turn.winner
    turn.pile_cards


    turn.award_spoils(winner)


    assert_equal [@card2, @card5, @card8, @card1, @card3], player1.deck.cards
    assert_equal [@card4, @card6, @card7], player2.deck.cards
  end

  def test_it_can_award_spoils_war

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)


    winner = turn.winner
    turn.pile_cards

    turn.award_spoils(winner)


    assert_equal [@card7, @card1, @card4, @card2, @card3, @card5, @card6], player2.deck.cards
    assert_equal [@card8], player1.deck.cards
  end

  def test_it_will_award_no_spoils_war_if_mutually_assured_destruction

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card9, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner
    turn.pile_cards

    turn.award_spoils(winner)

    assert_equal [@card8], player1.deck.cards
    assert_equal [@card7], player2.deck.cards
  end

end
