require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup

    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)


  end

  def test_it_exists

    deck = Deck.new()
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_a_name

    deck = Deck.new()
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
  end

  def test_it_has_a_deck

    deck = Deck.new(@card1, @card2, @card3)
    player = Player.new('Clarisa', deck)


    assert_instance_of Deck, player.deck
  end

  

end
