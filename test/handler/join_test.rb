require 'test/unit'
require 'handler/join'

class TestJoinHandler < Test::Unit::TestCase
  def test_400_when_game_is_already_started
    handler = Handler::Join.new(["y"])
    def handler.joined_players
      ["player1", "player2"]
    end
    handler.exec
    assert_equal("400", handler.result.messages[0].id)
  end

  def test_200_when_dryrun_to_join
    handler = Handler::Join.new([])
    def handler.joined_players
      ["player2"]
    end
    handler.exec
    assert_equal("200", handler.result.messages[0].id)
  end

  def test_201_when_join
    handler = Handler::Join.new(["y"])
    def handler.joined_players
      ["player2"]
    end
    handler.exec
    assert_equal("201", handler.result.messages[0].id)
  end

  def test_202_when_check_status_and_game_has_not_started
    handler = Handler::Join.new(["st"])
    def handler.joined_players
      ["player2"]
    end
    handler.exec
    assert_equal("202", handler.result.messages[0].id)
  end

  def test_203_when_check_status_and_game_has_started
    handler = Handler::Join.new(["st"])
    def handler.joined_players
      ["player1", "player2"]
    end
    handler.exec
    assert_equal("203", handler.result.messages[0].id)
  end
end

