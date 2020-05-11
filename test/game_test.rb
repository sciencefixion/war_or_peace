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

  def test_it_can_have_challengers

    game = Game.new

    assert_instance_of Player, game.challenger1
    assert_instance_of Player, game.challenger2
  end

  def test_it_can_shuffle_cards_and_deal

    game = Game.new

    game.shuffle_and_deal


    assert_equal 26, game.challenger1.deck.cards.count
    assert_equal 26, game.challenger2.deck.cards.count
  end

  def test_challenger2_can_win

    game = Game.new

    assert_equal true, game.organize_peace
  end

  def test_challenger1_can_win

    game = Game.new

    game.challenger1.deck.cards << game.all_cards.flatten!


    assert_equal true, game.organize_peace
  end

  def test_it_can_end_in_a_draw

    game = Game.new
    game.shuffle_and_deal

    game.round = 1000001

    assert_equal true, game.organize_peace
  end

  def test_it_can_start
    skip
    game = Game.new
    game.shuffle_and_deal
    game.start

  end


end
