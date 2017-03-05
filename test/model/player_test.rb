require 'test/unit'
require 'etc'
require 'model/player'

class TestPlayer < Test::Unit::TestCase
  def test_has_100_doller_after_gaining_100_doller
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_money(100)
    assert_equal(100, @player.money)
  end

  def test_money_cannnot_be_less_than_0
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_money(100)
    @player.lose_money(200)
    assert_equal(0, @player.money)
  end

  def test_can_gain_a_job
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_job(1)
    assert_equal(1, @player.jobs[0])
  end

  def test_cannot_gain_a_secondary_job_without_card_effect
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_job(1)
    @player.gain_job(2)
    assert_equal(nil, @player.jobs[1])
  end

  def test_can_gain_a_secondary_job_after_card_effect
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_job(1)
    @player.job_multiply
    @player.gain_job(2)
    assert_equal(2, @player.jobs[1])
  end

  def test_lose_a_job
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_job(1)
    @player.lose_job(1)
    assert_equal([], @player.jobs)
  end

  def test_lose_first_job
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_job(1)
    @player.job_multiply
    @player.gain_job(2)
    @player.lose_job(1)
    assert_equal(2, @player.jobs[0])
  end

  def test_gain_a_card
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_card(1)
    @player.gain_card(2)
    assert_equal(2, @player.cards.size)
  end

  def test_lose_a_card
    @player = Model::Player.new(Etc.getlogin) 
    @player.gain_card(1)
    @player.gain_card(2)
    @player.lose_card(2)
    assert_equal(1, @player.cards.size)
  end
end
