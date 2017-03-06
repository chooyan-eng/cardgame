require 'test/unit'
require 'test_helper'
require 'pathname'
require 'util/statuscheck'

class TestStatuscheck < Test::Unit::TestCase
  def test_game_is_started_if_two_players_have_own_directory
    player_dirs = [DATA_DIR.join("player1"), DATA_DIR.join("player2")]
    player_dirs.each { |dir| dir.mkdir }
    assert_true(Util::Statuscheck.game_started?)
    player_dirs.each { |dir| dir.delete }
  end

  def test_game_is_not_started_if_one_players_has_own_directory
    player_dirs = [DATA_DIR.join("player1")]
    player_dirs.each { |dir| dir.mkdir }
    assert_false(Util::Statuscheck.game_started?)
    player_dirs.each { |dir| dir.delete }
  end
end
