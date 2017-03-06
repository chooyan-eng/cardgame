require 'test/unit'
require 'model/player'
require 'util/data_io'
require 'test_helper'
require 'etc'
require 'pathname'

class TestDataIo < Test::Unit::TestCase
  def test_save_player_data
    player = new_player_data
    Util::DataIo.save_player(player)
    assert_true(MY_DIR.join("public.txt").exist?)
    assert_true(MY_DIR.join("private.txt").exist?)
    MY_DIR.children.each { |child| child.delete }
  end

  def test_save_correct_player_data
    player = new_player_data
    Util::DataIo.save_player(player)
    saved_player = Util::DataIo.load_player(Etc.getlogin)
    assert_equal(player.money, saved_player.money)
    assert_equal(player.jobs, saved_player.jobs)
    assert_equal(player.cards, saved_player.cards)
    MY_DIR.children.each { |child| child.delete }
  end

  def test_save_field_data
    field = new_field_data
    Util::DataIo.save_field(field)
    assert_true(DATA_DIR.join("field.txt").exist?)
    MY_DIR.children.each { |child| child.delete }
  end

  def test_save_correct_field_data
    field = new_field_data
    Util::DataIo.save_field(field)
    saved_field = Util::DataIo.load_field()
    assert_equal(field.cards, saved_field.cards)
    MY_DIR.children.each { |child| child.delete }
  end

  private
  def new_player_data
    Model::Player.new(Etc.getlogin, 300, [1], [1, 3, 5])
  end
end
