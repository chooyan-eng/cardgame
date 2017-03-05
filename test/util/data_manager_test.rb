require 'test/unit'
require 'model/player'
require 'util/data_io'

require 'etc'
require 'pathname'

class TestDataIo < Test::Unit::TestCase
  DATA_DIR = Pathname.pwd.join("data")
  MY_DIR = DATA_DIR.join("#{Etc.getlogin}")

  def test_can_save_player_data
    player = new_player_data
    Util::DataIo.save_player(player)
    assert_true(MY_DIR.join("public.txt").exist?)
    assert_true(MY_DIR.join("private.txt").exist?)
  end

  def test_can_save_correct_player_data
    player = new_player_data
    Util::DataIo.save_player(player)
    saved_player = Util::DataIo.load_player(Etc.getlogin)
    assert_equal(player.money, saved_player.money)
    assert_equal(player.jobs, saved_player.jobs)
    assert_equal(player.cards, saved_player.cards)
  end

  private
  def new_player_data
    Model::Player.new(Etc.getlogin, 300, [1], [1, 3, 5])
  end
end
