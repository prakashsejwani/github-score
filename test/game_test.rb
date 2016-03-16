require 'minitest/autorun'
require './exercise/lib/game'

class TestDhhScore < Minitest::Test

  def setup
    @game = Game.new('dhh')
  end

  def test_a_dhh_score
    assert_instance_of Game, @game
  end

  def test_get_a_game_score
    assert_match(/DHH's github score is/, @game.total_score)
  end
end