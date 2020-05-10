require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists

    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_has_a_full_deck

    game = Game.new

    assert_equal 52, game.all_cards.count
  end

  def test_it_can_have_players

    game = Game.new

    assert_instance_of Player, game.player1
    assert_instance_of Player, game.player2
  end

  def test_it_can_shuffle_cards_and_deal

    game = Game.new

    game.shuffle_and_deal


    assert_equal 26, game.player1.deck.cards.count
    assert_equal 26, game.player2.deck.cards.count
  end

  def test_it_can_start

    game = Game.new

    
  end

  def test_it_can_end
    skip

  end



end
