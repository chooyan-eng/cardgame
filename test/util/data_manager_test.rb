require 'test/unit'
require 'model/player'
require 'util/data_io'

require 'etc'
require 'pathname'

class TestDataIo < Test::Unit::TestCase
  DATA_DIR = Pathname.pwd.join("data")
  MY_FILE = DATA_DIR.join("#{Etc.getlogin}.txt")

  def test_can_save_data_file
    player = new_player_data
    Util::DataIo.save_player(player)
    assert_true(MY_FILE.exist?)
  end

  def test_can_save_correct_data_file
    player = new_player_data
    Util::DataIo.save_player(player)
    saved_player = Util::DataIo.load_player
    assert_equal(player.money, saved_player.money)
    assert_equal(player.jobs, saved_player.jobs)
    assert_equal(player.cards, saved_player.cards)
  end

  private
  def new_player_data
    player = Model::Player.new
    player.gain_money(300)
    player.gain_job(1)
    player.gain_card(1)
    player.gain_card(3)
    player.gain_card(5)
    player
  end
end
